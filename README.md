# CRF_BQCloud

- [CRF_BQCloud](#crfbqcloud)
  - [Apache beam: Batch Processing Airflow](#apache-beam-batch-processing-airflow)
    - [Step 1: Setup Google cloud project](#step-1-setup-google-cloud-project)
    - [Step 2: Create python environment](#step-2-create-python-environment)
    - [Step 3: DDL Code](#step-3-ddl-code)
      - [Code Folder Structure](#code-folder-structure)
      - [Parameters to main file](#parameters-to-main-file)
      - [Call to file](#call-to-file)
    - [Step 4: Data transfer code](#step-4-data-transfer-code)
      - [Code structure](#code-structure)
      - [File Descriptors](#file-descriptors)
        - [Json file](#json-file)
        - [orclbm_main.py](#orclbmmainpy)
      - [Parameters to main file](#parameters-to-main-file-1)
      - [Call to file](#call-to-file-1)
    - [Step 5: Apache Airflow](#step-5-apache-airflow)
      - [Installation and machine setup](#installation-and-machine-setup)
  - [Striim](#striim)
    - [Step 1: set up machine](#step-1-set-up-machine)
  - [Appendix](#appendix)

## Apache beam: Batch Processing Airflow

### Step 1: Setup Google cloud project
 
1. Set up the project as per the guide given in https://cloud.google.com/dataflow/docs/quickstarts/quickstart-python
2. Now we have to create a gcp compute instance. the minimum requirement for smooth running is 2 vCPUs, 9.5 GB memory . This is the custom opttion. To get here first start any other instance (preferable lower and complete the following steps). Google will then show a recommendation link in the compute instances page.
3. All firewall rules now need to be set up as per diagram
![Alt text](images/network.png?raw=true "Title")

### Step 2: Create python environment

We may either choose to develop locally or a VM in GCP. In either case it would be better if we start using a linux machine. The project has been developed on Ubuntu 16.04 and tested on ubuntu 14/18, centos, and macos mojhave. Since most machines will have python

1. install and update anaconda distribution for python 2.7 accepting all defaults : 
```
sudo wget https://repo.continuum.io/archive/Anaconda2-2018.12-Linux-x86_64.sh
bash Anaconda2-2018.12-Linux-x86_64.sh
python -m pip install --upgrade pip

```
2. set up oracle instant cleint as per https://medium.com/@arunkundgol/how-to-setup-oracle-instant-client-on-windows-subsystem-for-linux-cccee61d5b0b

3. install required packages after entering the project directory as

```
pip install -r requirements.txt

```

4. if the above hits an error then 

```
pip install cx_oracle
pip install apache-beam
pip install apache-beam[gcp]
pip install apache-airflow
pip install apache-airflow[gcp-api]
```

### Step 3: DDL Code

this code is for creating the data definition for the table in big query after reading the data definition from oracle. Currently this happens with one table only. This is intended since currently we are doing the processing through 3 m3chanisms- batch , streaming and striim.


####  Code Folder Structure
```
.DDL<br />
├── BeamProjectV1-48b0a434a29a.json<br />
├── db_schemav
│   ├── functions<br />
│   ├── packages<br />
│   ├── procedures<br />
│   ├── sequences<br />
│   ├── tables<br />
│   │   ├── fnd_flex_values.sql<br />
│   │   ├── fnd_flex_values_tl.sql<br />
│   │   ├── gl_balances.sql<br />
│   │   ├── gl_budget_types.sql<br />
│   │   ├── gl_budget_versions.sql<br />
│   │   ├── gl_budgets.sql<br />
│   │   ├── gl_code_combinations.sql<br />
│   │   ├── gl_daily_balances.sql<br />
│   │   ├── gl_daily_rates.sql<br />
│   │   ├── gl_date_period_map.sql<br />
│   │   ├── gl_je_batches.sql<br />
│   │   ├── gl_je_headers.sql<br />
│   │   ├── gl_je_lines.sql<br />
│   │   └── gl_ledgers.sql<br />
│   └── views<br />
├── ddl_main.py<br />
├── file.out<br />
└── src<br />
    ├── __init__.py<br />
    ├── __init__.pyc<br />
    ├── __pycache__<br />
    │   ├── __init__.cpython-37.pyc<br />
    │   └── oracleddl.cpython-37.pyc<br />
    ├── oracleddl.py<br />
    └── oracleddl.pyc<br />

```

#### Parameters to main file

1. variable name : **connect_string**
   1. Default value: **orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL**
   2. What is it: **connection string to oracle database. Thi includes the username and password**
2. variable name : **username**
   1. Default value: **GL**
   2. What is it: **oracle username**
3. variable name : **passwd**
   1. Default value: **GL**
   2. What is it: **Oracle db password** 
4. variable name : **separate_files**
   1. Default value: **True**
   2. What is it: **parameters for downloading the database tables, functions, triggers etc to separate files** 
5. variable name : **forcedir**
   1. Default value: **True**
   2. What is it: **this option forces rewrite of files in case the files** 
6. variable name : **out**
   1. Default value: **file.out**
   2. What is it: **output text file containing the information of ddl from oracle database**  
7. variable name : **addverinfo**
   1. Default value: **False**
   2. What is it: **this argument sets up the project version information in the output file meta data**
8. variable name : **alterbq**
   1. Default value: **True**
   2. What is it: **whether or not the change in oracle ddl is to be reflected in bigquery i.e. if this is set to true then the corresponding bigquery table is altered or created else only the definition is written to a static file(S)**
9. variable name : **gcred**
   1. Default value: **Credentials**
   2. What is it: **path to google project credentials**    
10. variable name : **tables_only**
    1.  Default value: **False**
    2.  What is it: **whether to save only table creation query or to save metadata as well** 
11. variable name : **gcp**
    1.  Default value: **beamprojectv1**
    2.  What is it: **name of the google coud project** 
12. variable name : **dtst**
    1.  Default value: **AWSRDS_GL**
    2.  What is it: **name of dataset or database** 
13. variable name : **tname**
    1.  Default value: **GL_JE_LINES**
    2.  What is it: **name of table in dataset**     


#### Call to file

python ddl_main.py --< parameter name 1> < parameter value 1> --< parameter name 2> < parameter value 3>


### Step 4: Data transfer code

#### Code structure

![Alt text](images/orclbmcodemap.png?raw=true "Title")
```
├── BeamProjectV1-48b0a434a29a.json<br />
├── __init__.py<br />
├── orclbm<br />
│   ├── __init__.py<br />
│   ├── __init__.pyc<br />
│   ├── orclbm.py<br />
│   └── orclbm.pyc<br />
├── orclbm.egg-info<br />
│   ├── PKG-INFO<br />
│   ├── SOURCES.txt<br />
│   ├── dependency_links.txt<br />
│   ├── requires.txt<br />
│   └── top_level.txt<br />
├── orclbm_main.py<br />
└── setup.py<br />

```


#### File Descriptors

##### Json file
This is the json file containing the credentials for the google cloud project thats was downloaded in the setting up of google cloud project part.

##### orclbm_main.py

This collects argumnets from the user and inputs the same for the Beam batch project top run. The arguments are as follows

#### Parameters to main file

1. variable name : **gcred**
   1. Default value: **BeamProjectV1-48b0a434a29a.json**
   2. What is it: **Path to google creds**
2. variable name : **bqpid**
   1. Default value: **beamprojectv1**
   2. What is it: **GCP project name**
3. variable name : **bqds**
   1. Default value: **AWSRDS_GL**
   2. What is it: **BigQuery Dataset name** 
4. variable name : **bqtbl**
   1. Default value: **GL_JE_LINES**
   2. What is it: **BigQuery table name** 
5. variable name : **orclcn**
   1. Default value: **GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL**
   2. What is it: **Oracle connection string** 
6. variable name : **runner**
   1. Default value: **DirectRunner**
   2. What is it: **runner to use DirectRunner or DataflowRunner**  
7. variable name : **setup**
   1. Default value: **./setup.py**
   2. What is it: **set up file for setting up the workers**
8. variable name : **savesess**
   1. Default value: **False**
   2. What is it: **save main session between workers**
9. variable name : **gdfjob**
   1. Default value: **myjob**
   2. What is it: **name of dataflow job**    
10. variable name : **gbstaging**
    1.  Default value: **gs://facbeambucketv1/staging**
    2.  What is it: **Path to google staging storage** 
11. variable name : **gbtemp**
    1.  Default value: **gs://facbeambucketv1/temp**
    2.  What is it: **Path to google temp storage** 
12. variable name : **batchquery**
    1.  Default value: **''**
    2.  What is it: **used to create a string which will create the filter condition on the query to be processed** 
13. variable name : **batchfield**
    1.  Default value: **'*'**
    2.  What is it: **fields to be pulled. currently its just a asterisk sign to get all fields** 


#### Call to file

```
python ddl_main.py --< parameter name 1> < parameter value 1> --< parameter name 2> < parameter value 3>

```
Post completion of both steps now we know that both ddl and data transfer works now we connect to airflow. For airflow we need t change the codes a little bit which we will come to in due course.

### Step 5: Apache Airflow

#### Installation and machine setup

1. Install airflow package for gcp

```
pip install apache-airflow[gcp_api]
```
2. Define airflow home

```
export AIRFLOW_HOME=~/airflow
```
3. Initialise database

```
airflow initdb
```
4. start the web server, default port is 8080. Note that the nohup and & allows you to close terminal.

```
nohup airflow webserver -p 8080 &
```

5. Now start the sceduler so it loads jobs to ui

```
nohup airflow scheduler &

```

6. Put all contents of your dag folder into /home/< username >/airflow/dags

contents of the dag folder is as follows

```
Dag
├── oracledagV9.py
└── orclbqfilesV9
    ├── BeamProjectV1-48b0a434a29a.json
    ├── __init__.py
    ├── __init__.pyc
    ├── __pycache__
    │   ├── __init__.cpython-37.pyc
    │   ├── oracleddl.cpython-37.pyc
    │   └── orclbm.cpython-37.pyc
    ├── db_schema
    │   ├── functions
    │   ├── packages
    │   ├── procedures
    │   ├── sequences
    │   ├── tables
    │   │   ├── fnd_flex_values.sql
    │   │   ├── fnd_flex_values_tl.sql
    │   │   ├── gl_balances.sql
    │   │   ├── gl_budget_types.sql
    │   │   ├── gl_budget_versions.sql
    │   │   ├── gl_budgets.sql
    │   │   ├── gl_code_combinations.sql
    │   │   ├── gl_daily_balances.sql
    │   │   ├── gl_daily_rates.sql
    │   │   ├── gl_date_period_map.sql
    │   │   ├── gl_je_batches.sql
    │   │   ├── gl_je_headers.sql
    │   │   ├── gl_je_lines.sql
    │   │   └── gl_ledgers.sql
    │   └── views
    ├── file.out
    ├── oracleddl.py
    ├── oracleddl.pyc
    ├── orclbm.py
    └── orclbm.pyc
```

7. in your browser now go to http:\\[gcp instance publlic IP]:8080\admin
8. Our dag has two tasks 
   1. creating the table definition or altering it
   2. data transfer to the table
9.  you should see your dag lloaded. If not please wait and refresh

![Alt text](images/dagmain.png?raw=true "Title")

![Alt text](images/dagtask.png?raw=true "Title")

the task has to turned on by the toggle swittch to the left.

9. To see the detailed status of the retries Please click on the dag name in the DAG column which will take you to the tree view which shows you what happened at every attempt

![Alt text](images/dagtasktree.png?raw=true "Title")

10. Each of the small oxes refer to a task retry. the significance of the colour of the boxes is given on the legend to the right. Clicking on one of them gives us the following windo on which we can monitor the logs  and has other options for rescheduling, remapping flow, ignoring unmet dependencies and so on


![Alt text](images/tasktretryopt.png?raw=true "Title")

11. finally we check if the task is actually  working in the big query query builder using the following query [Note this cchecks if the code is working at a broad level but doesnt show any issue that happened at a particular row. FOr this we must go through the logs] 

![Alt text](images/bq.png?raw=true "Title")


## Striim

### Step 1: set up machine

1. Goto  https://console.cloud.google.com/marketplace/browse?q=Striim&pli=1&utm_campaign=Product%20Download&utm_medium=email&_hsenc=p2ANqtz-8hP-Mj43okxt-omfdTzTnz-Yb84ieJCSTmCIOrk3f5qJ6S3tZoG2fWGTRsse8gVxOKWAXFkwNqwaZ8Y6ikr9WEtiz3eQ&_hsmi=66839972&utm_content=66839972&utm_source=hs_automation&hsCtaTracking=1139c9fb-fc9a-4d9c-b699-17b8c8af0a32%7C934a6def-e305-48da-8c4f-4a11675dba47 and select Striim (the first option)
2. Now select laung on compute engine
3. Download ojdbc7.jar from https://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html
4. upload the file to the striim machine using sftp and the move it to the required folder using sudo

```
sudo mv ojdbc7.jar /opt/striim/lib
```

5. upload the google credentials json and move to root folder and give required permissions

```
sudo mv BeamProjectV1-48b0a434a29a.json /
cd /
sudo chmod 777 BeamProjectV1-48b0a434a29a.json
```
6. Login to http://35.232.85.119:9080 [user: admin pwd: cloudreport123]
7. Go to Apps and add app (for creating new app)[the app for GL_Balances already existsORACL2BQ]
8. Click on start with template
9. Select Oracle cdc tto big query
10. Give a name to app
11. Now configure the logging and permission for the oracle db (directions given in following links)
    1.  https://docs.aws.amazon.com/dms/latest/sbs/CHAP_On-PremOracle2Aurora.Steps.ConfigureOracle.html
    2.  https://docs.oracle.com/database/121/SUTIL/GUID-D2DDD67C-E1CC-45A6-A2A7-198E4C142FA3.htm#SUTIL1583
    3.  https://docs.striim.com/en/enabling-archivelog.html
12. Both the archivelog and supplementary logs needs to be enabled and checked through the following
    1.  `select supplemental_log_data_min, supplemental_log_data_pk from v$database;` should return Yes,Yes
13. Provide the oracle connection parameters 
14. Connect to Oracle
15. Select the required table
16. Now provide the big query parameters
17. Select filters if required
18. Now on the app screen at the top select Deploy App and then Start App 


## Appendix

The google credentials json file needs to be present in 
1. the dags main folder
2. the ddl main folder
3. the orclbm main folder and the orclbm subfolder within orclbm
