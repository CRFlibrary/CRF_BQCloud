
#!/usr/bin/env python
# -*- coding: utf8 -*-
import argparse
from src.oracleddl import *




if __name__ == '__main__':
    # enter google project details
    parser = argparse.ArgumentParser()
    parser.add_argument('--connect_string' ,dest='connect_string',default="159.65.85.83:1521/VIS" ,help='Path to google creds')
    parser.add_argument('--username' ,dest='username' ,default="GL" ,help='GCP project name')
    parser.add_argument('--passwd' ,dest='passwd' ,default="GL" ,help='BigQuery Dataset name')
    parser.add_argument('--date_dir' ,dest='date_dir' ,default=False ,help='Oracle connection string')
    parser.add_argument('--separate_files' ,dest='separate_files' ,default=True ,help='BigQuery table name')
    parser.add_argument('--forcedir' ,dest='forcedir' ,default=True ,help='Oracle connection string')
    parser.add_argument('--out' ,dest='out' ,default='file.out' ,help='runner to use DirectRunner or DataflowRunner')
    parser.add_argument('--addverinfo' ,dest='addverinfo' ,default=False ,help='set up file for workers')
    parser.add_argument('--alterbq' ,dest='alterbq' ,default=True ,help='save main session')
    parser.add_argument('--gcred' ,dest='gcred' ,default="BeamProjectV1-48b0a434a29a.json" ,help='name of dataflow job')
    parser.add_argument('--tables_only' ,dest='tables_only' ,default=True ,help='name of dataflow job')
    parser.add_argument('--gcp' ,dest='gcp' ,default="beamprojectv1" ,help='save main session')
    parser.add_argument('--dtst' ,dest='dtst' ,default="AWSRDS_GL" ,help='name of dataflow job')
    parser.add_argument('--tname' ,dest='tname' ,default="GL_JE_LINES" ,help='name of dataflow job')
    args = parser.parse_args()
    ddlrun(args)


