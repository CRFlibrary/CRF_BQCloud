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



default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2019,1,31),
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 5,
    'retry_delay': timedelta(minutes=1),
    #'schedule_interval': '@once',

}


dag = DAG(
 dag_id='Fact_GL_JE_LINES_7',
 schedule_interval='@once',
 default_args=default_args
)

ddldict={"--connect_string": "159.65.85.83:1521/VIS",
          "--username": "GL",
          "--passwd": "GL",
          "--separate_files": True,
          "--forcedir": True,
          "--date_dir": False,
          "--out": "file.out",
          "--addverinfo": False,
          "--alterbq": True,
          "--gcred": "/home/swapnil_keshetty/airflow/dags/setupcrf-6da795b61160.json",
          "--tables_only": True,
          "--gcp": "setupcrf",
          "--dtst": "AWSRDS_GL",
          "--tname": "GL_JE_LINES"}
bashargs = str(ddldict).replace(": ", " ").replace(",", "").replace("}", "").replace("{", "").replace("'","")
run_DDL = BashOperator(
    task_id='createtabledefn',
    bash_command="python /home/swapnil_keshetty/airflow/dags/orclbqfilesV9/oracleddl.py "+bashargs,
    dag=dag,
)
run_DT = PythonOperator(
    task_id='gettabledata',
    python_callable=orclbm.runbeampipe,
    op_kwargs={"orclcn": "apps/apps@159.65.85.83:1521/VIS",
            "bqpid":"setupcrf",
            "bqds":"AWSRDS_GL",
            "bqtbl":"GL_JE_LINES",
            "runner":"DataflowRunner",
            "numwork":5,
            "autoscale":"THROUGHPUT_BASED",
            "maxnumwork":10,
            "setup":"./setup.py",
            "savesess":False,
            "gdfjob":"myjob",
            "gcred":"/home/swapnil_keshetty/airflow/dags/setupcrf-6da795b61160.json",
            "gbstaging":"gs://crfbeamstoragebucket/staging",
            "gbtemp":"gs://tempstoragebucket/temp"},
    dag=dag,
)


run_DDL >> run_DT




if __name__ == "__main__":
    dag.cli()
