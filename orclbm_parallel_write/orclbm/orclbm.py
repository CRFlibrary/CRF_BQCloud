#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Dec 27 14:37:23 2018

@author: abhishek
"""
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# declare libraries
from __future__ import absolute_import
from __future__ import division
from google.cloud import bigquery
from apache_beam.io.gcp.internal.clients import bigquery as bbq
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import GoogleCloudOptions
from apache_beam.options.pipeline_options import StandardOptions
from apache_beam.options.pipeline_options import SetupOptions
from apache_beam.options.pipeline_options import WorkerOptions
from apache_beam.transforms import PTransform, ParDo, DoFn, Create
from apache_beam.io import iobase, range_trackers
from random import randint
import os
import cx_Oracle
import apache_beam as beam
import datetime

__all__ = ['ReadFromOracle']


class _OracleSource(iobase.BoundedSource):
    """
    A :class:`~apache_beam.io.iobase.BoundedSource` for reading from Oracle.
        :param iobase.BoundedSource:
    """

    def __init__(self, connection_string, db, table, query=None, fields=None):
        """
         Initializes :class:`_MongoSource`
            :param self:
            :param connection_string:
            :param db:
            :param table:
            :param query=None:
            :param fields=None:
        """
        self._connection_string = connection_string
        self._db = db
        self._table = table
        self._fields = fields
        self._client = None

        # Prepare query
        self._query = query
        if not self._query:
            self._query = ''

    @property
    def client(self):
        """
        Returns a oracle client. The client is not pickable so it cannot
        be part of the main object.
            :param self:
        """
        if self._client:
            return self._client
        self._client = cx_Oracle.connect(self._connection_string)
        return self._client

    def estimate_size(self):
        """
        Implements :class:`~apache_beam.io.iobase.BoundedSource.estimate_size`
            :param self:
        """
        cur = self.client.cursor()
        cur.execute('select count(*) from ' + self._table + self._query)
        res = 0
        for result in cur:
            res = result[0]
        return res

    def get_range_tracker(self, start_position, stop_position):
        """
        Implements :class:`~apache_beam.io.iobase.BoundedSource.get_range_tracker`
            :param self:
            :param start_position:
            :param stop_position:
        """
        if start_position is None:
            start_position = 0
        if stop_position is None:
            stop_position = range_trackers.OffsetRangeTracker.OFFSET_INFINITY

        # Use an unsplittable range tracker. This means that a collection can
        # only be read sequentially for now.
        range_tracker = range_trackers.OffsetRangeTracker(start_position, stop_position)
        range_tracker = range_trackers.UnsplittableRangeTracker(range_tracker)

        return range_tracker

    def read(self, range_tracker):  # , range_tracker):
        """
        Implements :class:`~apache_beam.io.iobase.BoundedSource.read`
            :param self:
            :param range_tracker:
        """
        cur = self.client.cursor()
        cur.execute('select ' + self._fields + ' from ' + self._table + self._query)
        for row in cur:
            yield row

    def split(self, desired_bundle_size, start_position=None, stop_position=None):
        """
        Implements :class:`~apache_beam.io.iobase.BoundedSource.split`
        This function will currently not be called, because the range tracker
        is unsplittable
            :param self:
            :param desired_bundle_size:
            :param start_position=None:
            :param stop_position=None:
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
    """
    A :class:`~apache_beam.transforms.ptransform.PTransform` for reading
    from MongoDB.
        :param PTransform:
    """

    def __init__(self, connection_string, db, table, query=None, fields=None):
        """
        Initializes :class:`ReadFromOracle`
        Uses source :class:`_MongoSource`
            :param self:
            :param connection_string:
            :param db:
            :param table:
            :param query=None:
            :param fields=None:
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
        """
        Implements :class:`~apache_beam.transforms.ptransform.PTransform.expand`
            :param self:
            :param pcoll:
        """
        return pcoll | iobase.Read(self._source)

    def display_data(self):
        """
        display data
            :param self:
        """
        return {'source_dd': self._source}


class ParseJsonDoFn(beam.DoFn):
    A_TYPE = 'tag_1'
    B_TYPE = 'tag_2'
    C_TYPE = 'tag_3'

    def process(self, document, tableschema):
        """
        Transform document for upload to bigquery
            :param document:
            :param tableschema:
        """
        recdict = dict()
        vals = document
        itr = 0
        for fld in tableschema:
            if (str(fld.field_type) == "INTEGER"):
                try:
                    recdict[str(fld.name)] = int(vals[itr])
                except:
                    recdict[str(fld.name)] = 0
            elif (str(fld.field_type) == "FLOAT"):
                try:
                    recdict[str(fld.name)] = float(vals[itr])
                except:
                    recdict[str(fld.name)] = 0.0
            elif (str(fld.field_type) == "STRING"):
                recdict[str(fld.name)] = str(vals[itr])
            elif (str(fld.field_type) == "DATE"):
                try:
                    dt = str(vals[itr])[:-9]
                    actdt = datetime.datetime.strptime(dt, "%Y-%m-%d")
                    recdict[str(fld.name)] = dt
                except:
                    recdict[str(fld.name)] = '2000-01-01'
            else:
                recdict[str(fld.name)] = 'NA'
            itr = itr + 1
            randchoice = randint(1, 3)
            if (randchoice == 1):
                yield beam.pvalue.TaggedOutput(self.A_TYPE, recdict)
            elif (randchoice == 2):
                yield beam.pvalue.TaggedOutput(self.B_TYPE, recdict)
            else:
                yield beam.pvalue.TaggedOutput(self.C_TYPE, recdict)


def run(args):
    """
    run method
        :param args:
    """
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = args.gcred
    #    os.environ["LD_LIBRARY_PATH"]=os.path.join(os.getcwd(),"orclbm","instantclient_18_3")
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
    # google_cloud_options.template_location = args.gbtemplate
    options.view_as(StandardOptions).runner = args.runner  # 'DataflowRunner'#DirectRunner
    if (args.runner == 'DataflowRunner'):
        options.view_as(WorkerOptions).num_workers = args.numwork
        options.view_as(WorkerOptions).autoscaling_algorithm = args.autoscale
        options.view_as(WorkerOptions).max_num_workers = args.maxnumwork
    options.view_as(SetupOptions).save_main_session = args.savesess
    options.view_as(SetupOptions).setup_file = args.setup
    with beam.Pipeline(options=options) as pipeline:
        lines = pipeline | ReadFromOracle(connection_string, args.bqds, args.bqtbl, query=args.batchquery,
                                          fields=args.batchfield)

    multiple_lines = (
            lines
            | 'ParseJSON' >> (beam.ParDo(ParseJsonDoFn(),table.schema).with_outputs(
        ParseJsonDoFn.A_TYPE,
        ParseJsonDoFn.B_TYPE,
        ParseJsonDoFn.C_TYPE)))

    a_line = multiple_lines.tag_1
    b_line = multiple_lines.tag_2
    c_line = multiple_lines.tag_3

    (a_line
     | "output_a" >> beam.io.WriteToBigQuery(table_spec,
                                             schema=table_schema,
                                             write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                             create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED))

    (b_line
     | "output_b" >> beam.io.WriteToBigQuery(table_spec,
                                             schema=table_schema,
                                             write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                             create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED))

    (c_line
     | "output_c" >> beam.io.WriteToBigQuery(table_spec,
                                             schema=table_schema,
                                             write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                             create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED))

    pipeline.run().wait_until_finish()
    pass


