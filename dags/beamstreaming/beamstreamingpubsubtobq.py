#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 14:34:11 2019

@author: abhishek
"""

from __future__ import absolute_import
import argparse
import logging
import datetime
import os
import json
import apache_beam as beam
from google.cloud import bigquery
from apache_beam.io.gcp.internal.clients import bigquery as bbq
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import GoogleCloudOptions
from apache_beam.options.pipeline_options import StandardOptions
from apache_beam.options.pipeline_options import SetupOptions



def transform_doc(lines,tableschema):
    """
    Transform document for upload to bigquery
    """
    data = lines.replace(", '",',"').replace("\'",'"').replace("None","\"NONE\"")
    dtstrfrm = '2000-01-01'
    while (data.find('datetime.datetime')>=0):
        dtstr = data[data.find('datetime.datetime'):(data.find('datetime.datetime') + data[data.find('datetime.datetime'):].find('"') - 1)]
        exec("dtstrfrm = " + dtstr + ".strftime('%Y-%m-%d')")
        data = data.replace(dtstr,'"'+dtstrfrm + '"')
    recdict = json.loads(data)
    for key in list(recdict.keys()):
        recdict[str(key)]=recdict.pop(key)
    for fld in tableschema:
        oldkey = [item for item in list(recdict.keys()) if str(item).lower() == str(fld.name).lower()][0]
        recdict[str(fld.name)] = recdict.pop(oldkey)
        if (str(fld.field_type) == "INTEGER"):
            try:
                recdict[str(fld.name)] = int(recdict[str(fld.name)])
            except:
                recdict[str(fld.name)] = 0
        elif (str(fld.field_type) == "FLOAT"):
            try:
                recdict[str(fld.name)] = float(recdict[str(fld.name)])
            except:
                recdict[str(fld.name)] = 0.0
        elif (str(fld.field_type) == "STRING"):
            recdict[str(fld.name)] = str(recdict[str(fld.name)])
        elif (str(fld.field_type) == "DATE"):
            try:
                actdt = datetime.datetime.strptime(recdict[str(fld.name)], "%Y-%m-%d")
                recdict[str(fld.name)] = recdict[str(fld.name)]
            except:
                recdict[str(fld.name)] = '2000-01-01'
        else:
            recdict[str(fld.name)] = 'NA'
    return(recdict)


def main(args):
    """Build and run the pipeline."""
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = args.gcred
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
    options = PipelineOptions()
    google_cloud_options = options.view_as(GoogleCloudOptions)
    google_cloud_options.project = args.bqpid
    google_cloud_options.job_name = args.gdfjob
    google_cloud_options.staging_location = args.gbstaging
    google_cloud_options.temp_location = args.gbtemp
    # google_cloud_options.template_location = args.gbtemplate
    options.view_as(StandardOptions).runner = args.runner  # 'DataflowRunner'#DirectRunner
    options.view_as(SetupOptions).save_main_session = args.savesess
    options.view_as(StandardOptions).runner = args.runner
    options.view_as(SetupOptions).save_main_session = True
    options.view_as(StandardOptions).streaming = True
    with beam.Pipeline(options=options) as p:
        # Read the pubsub topic into a PCollection.
        (p
         | 'read' >> beam.io.ReadStringsFromPubSub(topic=args.input_topic)
         | 'transform' >> beam.Map(transform_doc,table.schema)
         | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(table_spec,
                                                schema=table_schema,
                                                write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                                create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED))


if __name__ == '__main__':
    logging.getLogger().setLevel(logging.INFO)
    parser = argparse.ArgumentParser()
    parser.add_argument('--gcred', dest='gcred', default="BeamProjectV1-48b0a434a29a.json",help='Path to google creds')
    parser.add_argument('--input_topic', dest='input_topic',default='projects/beamprojectv1/topics/GL_JE_LINES',help='Input PubSub topic of the form projects/<PROJECT>/topics/<TOPIC>')
    parser.add_argument('--bqpid', dest='bqpid', default="beamprojectv1", help='GCP project name')
    parser.add_argument('--bqds', dest='bqds', default="AWSRDS_GL", help='BigQuery Dataset name')
    parser.add_argument('--bqtbl', dest='bqtbl', default="GL_JE_LINES", help='BigQuery table name')
    parser.add_argument('--gdfjob', dest='gdfjob', default='myjob', help='name of dataflow job')
    parser.add_argument('--gbstaging', dest='gbstaging', default='gs://facbeambucketv1/staging',help='Path to google staging storage')
    parser.add_argument('--gbtemp', dest='gbtemp', default='gs://facbeambucketv1/temp',help='Path to google temp storage')
    parser.add_argument('--runner', dest='runner', default='DirectRunner',help='runner to use DirectRunner or DataflowRunner')
    parser.add_argument('--savesess', dest='savesess', default=True, help='save main session')
    args = parser.parse_args()
    main(args)