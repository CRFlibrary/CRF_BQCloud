#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Jan  7 13:50:32 2019

@author: abhishek
"""

from __future__ import print_function
from airflow.operators import BashOperator
from airflow.models import DAG
from datetime import datetime, timedelta

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

run_pub = BashOperator(
    task_id='createpub',
    bash_command="python /home/abhishek/airflow/dags/beamstreaming/orcltopubsub.py",
    params = {"whichconf": 0},
    dag=dag,
)


run_sub = BashOperator(
    task_id='runsub',
    bash_command="python /home/abhishek/airflow/dags/beamstreaming/beamstreamingpubsubtobq.py",
    op_kwargs={"gcred": "/home/abhishek/airflow/dags/BeamProjectV1-48b0a434a29a.json",
            "input_topic":"projects/beamprojectv1/topics/GL_JE_LINES",
            "bqpid":"beamprojectv1",
            "bqds":"AWSRDS_GL",
            "bqtbl":"GL_JE_LINES",
            "gdfjob":"myjob",
            "gbstaging":"gs://facbeambucketv1/staging",
            "gbtemp":"gs://facbeambucketv1/temp",
            "runner":"DirectRunner",
            "savesess":True},
    dag=dag,
)


run_pub >> run_sub


if __name__ == "__main__":
    dag.cli()
