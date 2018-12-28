#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Dec 27 14:37:23 2018

@author: abhishek
"""

#declare libraries
from __future__ import absolute_import
from __future__ import division
from google.cloud import bigquery
from apache_beam.io.gcp.internal.clients import bigquery as bbq
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import GoogleCloudOptions
from apache_beam.options.pipeline_options import StandardOptions
from apache_beam.options.pipeline_options import SetupOptions
from apache_beam.transforms import PTransform#, ParDo, DoFn, Create
from apache_beam.io import iobase, range_trackers
import cx_Oracle
import os
import apache_beam as beam
import datetime

__all__ = ['ReadFromOracle']

class _OracleSource(iobase.BoundedSource):
    """A :class:`~apache_beam.io.iobase.BoundedSource` for reading from Oracle."""

    def __init__(self, connection_string, db, table, query=None, fields=None):
        """Initializes :class:`_MongoSource`"""
        self._connection_string = connection_string
        self._db = db
        self._table = table
        self._fields = fields
        self._client = None

        # Prepare query
        self._query = query
        if not self._query:
            self._query = {}

    @property
    def client(self):
        """Returns a oracle client. The client is not pickable so it cannot
        be part of the main object.
        """
        if self._client:
            return self._client
        self._client = cx_Oracle.connect(self._connection_string)
        return self._client

    def estimate_size(self):
        """Implements :class:`~apache_beam.io.iobase.BoundedSource.estimate_size`"""
        cur = self.client.cursor()
        cur.execute('select count(*) from '+ self._table)
        res=0
        for result in cur:
            res = result[0]
        return res

    def get_range_tracker(self, start_position, stop_position):
        """Implements :class:`~apache_beam.io.iobase.BoundedSource.get_range_tracker`"""
        if start_position is None:
            start_position = 0
        if stop_position is None:
            stop_position = range_trackers.OffsetRangeTracker.OFFSET_INFINITY

        # Use an unsplittable range tracker. This means that a collection can
        # only be read sequentially for now.
        range_tracker = range_trackers.OffsetRangeTracker(start_position, stop_position)
        range_tracker = range_trackers.UnsplittableRangeTracker(range_tracker)

        return range_tracker

    def read(self, range_tracker):#, range_tracker):
        """Implements :class:`~apache_beam.io.iobase.BoundedSource.read`"""

        cur = self.client.cursor()
        cur.execute('select * from '+ self._table + " where rownum <= 10")
        for row in cur:
            yield row

    def split(self, desired_bundle_size, start_position=None, stop_position=None):
        """Implements :class:`~apache_beam.io.iobase.BoundedSource.split`
        This function will currently not be called, because the range tracker
        is unsplittable
        """
        if start_position is None:
            start_position = 0
        if stop_position is None:
            stop_position = range_trackers.OffsetRangeTracker.OFFSET_INFINITY

        # Because the source is unsplittable (for now), only a single source is
        # returned.
        yield iobase.SourceBundle(
            weight=1,
            source=self,
            start_position=start_position,
            stop_position=stop_position)
        
        


class ReadFromOracle(PTransform):
    """A :class:`~apache_beam.transforms.ptransform.PTransform` for reading
    from MongoDB.
    """
    def __init__(self, connection_string, db, table, query=None, fields=None):
        """Initializes :class:`ReadFromMongo`
        Uses source :class:`_MongoSource`
        """
        super(ReadFromOracle, self).__init__()
        self._connection_string = connection_string
        self._db = db
        self._table = table
        self._query = query
        self._fields = fields
        self._source = _OracleSource(
            self._connection_string,
            self._db,
            self._table,
            query=self._query,
            fields=self._fields)

    def expand(self, pcoll):
        """Implements :class:`~apache_beam.transforms.ptransform.PTransform.expand`"""
        return pcoll | iobase.Read(self._source)

    def display_data(self):
        return {'source_dd': self._source}
    
       
def transform_doc(document,tableschema):
    recdict=dict()
    vals=document
    itr=0
    for fld in tableschema:
        if (str(fld.field_type)=="INTEGER"):
            try:
                recdict[str(fld.name)]= int(vals[itr])
            except:
                recdict[str(fld.name)]= 0
        elif (str(fld.field_type)=="FLOAT"):
            try:
                recdict[str(fld.name)]= float(vals[itr])
            except:
                recdict[str(fld.name)]= 0.0
        elif (str(fld.field_type)=="STRING"):
            recdict[str(fld.name)]= str(vals[itr])
        elif (str(fld.field_type)=="DATE"):
            try:
                dt=str(vals[itr])[:-9]
                actdt = datetime.datetime.strptime(dt,"%Y-%m-%d")
                recdict[str(fld.name)]= dt
            except:
                recdict[str(fld.name)]= '2000-01-01'
        else:
            recdict[str(fld.name)]= 'NA'
        itr=itr+1
    return(recdict)
    
    
    
def run(args):
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"]=args.gcred
    client = bigquery.Client()
    dataset_ref = client.dataset(args.bqds)    
    table_ref = dataset_ref.table(args.bqtbl)
    table = client.get_table(table_ref)
    table_schema = bbq.TableSchema()
    for fld in table.schema:
        source_field = bbq.TableFieldSchema()
        source_field.name = str(fld.name)
        source_field.type = str(fld.field_type)
        source_field.mode = str(fld.mode)
        table_schema.fields.append(source_field)
    table_spec = bbq.TableReference(
        projectId=args.bqpid,
        datasetId=args.bqds,
        tableId=args.bqtbl)
    connection_string = args.orclcn 
    options = PipelineOptions()
    google_cloud_options = options.view_as(GoogleCloudOptions)
    google_cloud_options.project = args.bqpid
    google_cloud_options.job_name = args.gdfjob
    google_cloud_options.staging_location = args.gbstaging
    google_cloud_options.temp_location = args.gbtemp
    options.view_as(StandardOptions).runner = args.runner#'DataflowRunner'#DirectRunner
    options.view_as(SetupOptions).save_main_session= args.savesess
    options.view_as(SetupOptions).setup_file= args.setup
    with beam.Pipeline(options=options) as pipeline:
        (pipeline
         | 'read' >> ReadFromOracle(connection_string, args.bqds, args.bqtbl, query={}, fields=[])
         | 'transform' >> beam.Map(transform_doc,table.schema)
         | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(table_spec,
                                                        schema=table_schema,
                                                        write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                                        create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED))
    pass

    
