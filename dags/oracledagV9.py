#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Jan  7 13:50:32 2019

@author: abhishek
"""

from __future__ import print_function
from airflow.operators import PythonOperator
from airflow.operators import BashOperator
from airflow.models import DAG
from datetime import datetime, timedelta
from orclbqfilesV9.orclbm import *
from orclbqfilesV9 import orclbm

rightnow = datetime.combine(
        datetime.today() - timedelta(7), datetime.min.time())
schedule = timedelta(minutes=5)
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': rightnow,
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}


dag = DAG(
 dag_id='orclbqbeambatchv9_1',
 schedule_interval=schedule, 
 default_args=default_args
)

run_DDL = BashOperator(
    task_id='createtabledefn',
    bash_command="python /home/abhishek/airflow/dags/orclbqfilesV9/oracleddl.py",
    params = {"connect_string": "orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL",
            "username":"GL",
            "passwd":"GL",
            "separate_files":True,
            "forcedir":True,
            "datedir":False,
            "out":"file.out",
            "addverinfo":False,
            "alterbq":True,
            "gcred":"/home/abhishek/airflow/dags/BeamProjectV1-48b0a434a29a.json",
            "tables_only":False,
            "gcp": "beamprojectv1",
            "dtst": "AWSRDS_GL",
            "tname": "GL_JE_LINES"},
    dag=dag,
)


run_DT = PythonOperator(
    task_id='gettabledata',
    python_callable=orclbm.runbeampipe,
    op_kwargs={"orclcn": "GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL",
            "bqpid":"beamprojectv1",
            "bqds":"AWSRDS_GL",
            "bqtbl":"GL_JE_LINES",
            "runner":"DirectRunner",
            "setup":"./setup.py",
            "savesess":False,
            "gdfjob":"myjob",
            "gcred":"/home/abhishek/airflow/dags/BeamProjectV1-48b0a434a29a.json",
            "gbstaging":"gs://facbeambucketv1/staging",
            "gbtemp":"gs://facbeambucketv1/temp"},
    dag=dag,
)


run_DDL >> run_DT


if __name__ == "__main__":
    dag.cli()
