#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from __future__ import absolute_import

#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

"""
Below is a complete command line for running the orcl remotely as
an example:

python orclbm.py --setup_file ./setup.py 
  

"""

import argparse
import logging
from orclbm import orclbm

if __name__ == '__main__':
    """Call to main function

        This the part which calls the actualm class after parsing the arguments
        :param2: **gcred**
           .. Default value: **BeamProjectV1-48b0a434a29a.json**
           .. What is it: **Path to google creds**
        :param3: **bqpid**
           .. Default value: **beamprojectv1**
           .. What is it: **GCP project name**
        :param4: **bqds**
           .. Default value: **AWSRDS_GL**
           .. What is it: **BigQuery Dataset name** 
        :param5: **bqtbl**
           .. Default value: **GL_JE_LINES**
           .. What is it: **BigQuery table name** 
        :param6: **orclcn**
           .. Default value: **GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL**
           .. What is it: **Oracle connection string** 
        :param7: **runner**
           .. Default value: **DirectRunner**
           .. What is it: **runner to use DirectRunner or DataflowRunner**  
        :param8: **setup**
           .. Default value: **./setup.py**
           .. What is it: **set up file for setting up the workers**
        :param9: **savesess**
           .. Default value: **False**
           .. What is it: **save main session**
        :param10: **gdfjob**
           .. Default value: **myjob**
           .. What is it: **name of dataflow job**    
        :param11: **gbstaging**
           .. Default value: **gs://facbeambucketv1/staging**
           .. What is it: **Path to google staging storage** 
        :param12: **gbtemp**
           .. Default value: **gs://facbeambucketv1/temp**
           .. What is it: **Path to google temp storage** 
          
    """
    logging.getLogger().setLevel(logging.INFO)
    #enter google project details
    parser = argparse.ArgumentParser()
    parser.add_argument('--gcred',dest='gcred',default="BeamProjectV1-48b0a434a29a.json",help='Path to google creds')
    parser.add_argument('--bqpid',dest='bqpid',default="beamprojectv1",help='GCP project name')
    parser.add_argument('--numwork', dest='numwork', default=5, help='Number of workers')
    parser.add_argument('--autoscale', dest='autoscale', default='THROUGHPUT_BASED', help='Number of workers')
    parser.add_argument('--maxnumwork', dest='maxnumwork', default=10, help='Number of workers')
    parser.add_argument('--bqds',dest='bqds',default="AWSRDS_GL",help='BigQuery Dataset name')
    parser.add_argument('--bqtbl',dest='bqtbl',default="GL_JE_LINES",help='BigQuery table name')
    parser.add_argument('--orclcn',dest='orclcn',default='GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL',help='Oracle connection string')
    parser.add_argument('--runner',dest='runner',default='DirectRunner',help='runner to use DirectRunner or DataflowRunner')
    parser.add_argument('--setup',dest='setup',default='./setup.py',help='set up file for workers')
    parser.add_argument('--savesess',dest='savesess',default=False,help='save main session')
    parser.add_argument('--gdfjob',dest='gdfjob',default='myjob',help='name of dataflow job')
    parser.add_argument('--gbstaging',dest='gbstaging',default='gs://facbeambucketv1/staging',help='Path to google staging storage')
    parser.add_argument('--gbtemp',dest='gbtemp',default='gs://facbeambucketv1/temp',help='Path to google temp storage')
    parser.add_argument('--batchquery', dest='batchquery', default='',help='Path to google staging storage')
    parser.add_argument('--batchfield', dest='batchfield', default='*',help='Path to google temp storage')
    args = parser.parse_args()
    orclbm.run(args)
