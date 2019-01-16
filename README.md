<!-- vscode-markdown-toc -->
* 1. [Apache beam: Batch Processing Airflow](#Apachebeam:BatchProcessingAirflow)
	* 1.1. [Step 1: Setup Google cloud project](#Step1:SetupGooglecloudproject)
	* 1.2. [Step 2: Create python environment](#Step2:Createpythonenvironment)
	* 1.3. [Step 3: DDL Code](#Step3:DDLCode)
		* 1.3.1. [ Code Folder Structure](#CodeFolderStructure)
		* 1.3.2. [Parameters to main file](#Parameterstomainfile)
		* 1.3.3. [Call to file](#Calltofile)
	* 1.4. [Step 4: Data transfer code](#Step4:Datatransfercode)
		* 1.4.1. [Code structure](#Codestructure)
		* 1.4.2. [File Descriptors](#FileDescriptors)
		* 1.4.3. [Parameters to main file](#Parameterstomainfile-1)
		* 1.4.4. [Call to file](#Calltofile-1)
* 2. [Striim](#Striim)
	* 2.1. [Step 1: set up machine](#Step1:setupmachine)
* 3. [Apache BEAM streaming](#ApacheBEAMstreaming)
	* 3.1. [Set up](#Setup)
	* 3.2. [Folder structure](#Folderstructure)
	* 3.3. [Configuration for publisher (orcltopubsub.json)](#Configurationforpublisherorcltopubsub.json)
	* 3.4. [Call to publisher](#Calltopublisher)
	* 3.5. [Arguments for subscriber and streamer](#Argumentsforsubscriberandstreamer)
	* 3.6. [Call to subscriber and streamer](#Calltosubscriberandstreamer)
* 4. [Step 5: Apache Airflow Integration](#Step5:ApacheAirflowIntegration)
	* 4.1. [Installation and machine setup](#Installationandmachinesetup)
	* 4.2. [DAG: BEAM Batch Precessing](#DAG:BEAMBatchPrecessing)
	* 4.3. [DAG: BEAM Stream Precessing](#DAG:BEAMStreamPrecessing)
		* 4.3.1. [Folder structure](#Folderstructure-1)
	* 4.4. [Run on UI](#RunonUI)
* 5. [Appendix](#Appendix)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

# CRF_BQCloud

##  1. <a name='Apachebeam:BatchProcessingAirflow'></a>Apache beam: Batch Processing Airflow

###  1.1. <a name='Step1:SetupGooglecloudproject'></a>Step 1: Setup Google cloud project
 
1. Set up the project as per the guide given in <https://cloud.google.com/dataflow/docs/quickstarts/quickstart-python>
2. Now we have to create a gcp compute instance. the minimum requirement for smooth running is 2 vCPUs, 9.5 GB memory . This is the custom opttion. To get here first start any other instance (preferable lower and complete the following steps). Google will then show a recommendation link in the compute instances page.
3. All firewall rules now need to be set up as per diagram
![Alt text](images/network.png?raw=true "Title")

###  1.2. <a name='Step2:Createpythonenvironment'></a>Step 2: Create python environment

We may either choose to develop locally or a VM in GCP. In either case it would be better if we start using a linux machine. The project has been developed on Ubuntu 16.04 and tested on ubuntu 14/18, centos, and macos mojhave. Since most machines will have python

1. install and update anaconda distribution for python 2.7 accepting all defaults :

```
sudo apt-get update
sudo apt-get install bzip2
sudo wget https://repo.continuum.io/archive/Anaconda2-2018.12-Linux-x86_64.sh
bash Anaconda2-2018.12-Linux-x86_64.sh
python -m pip install --upgrade pip

```
2. set up oracle instant cleint as per https://oracle.github.io/odpi/doc/installation.html#linux   (oracle linux zip)

```
cd
wget https://storage.googleapis.com/facbeambucketv1/files/instantclient-basic-linux.x64-18.3.0.0.0dbru.zip
sudo apt-get install unzip
sudo mkdir -p /opt/oracle
sudo unzip instantclient-basic-linux.x64-18.3.0.0.0dbru.zip -d /opt/oracle
sudo sh -c "echo /opt/oracle/instantclient_18_3 > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig
export LD_LIBRARY_PATH=/opt/oracle/instantclient_18_3:$LD_LIBRARY_PATH
sudo nano /etc/environment
```
in the editor window add 
```
LD_LIBRARY_PATH=/opt/oracle/instantclient_18_3:$LD_LIBRARY_PATH
```
save and exit
then run
```
source /etc/environment
```

3. install required packages after entering the project directory as

```
pip install -r requirements.txt

```

4. if the above hits an error then 

```
sudo apt-get install gcc g++
export SLUGIFY_USES_TEXT_UNIDECODE=yes
pip install cx_oracle
pip install apache-beam
pip install apache-beam[gcp]
pip install apache-airflow
pip install apache-airflow[gcp-api]
pip install google-cloud-storage
pip install google-cloud-bigqyery
```

5. Download the repository
  
```
sudo apt-get install git
git clone https://github.com/CRFlibrary/CRF_BQCloud.git
```

to get latest repo copy
```
git pull
```
now by entering thps directory u can see the infividual projects

###  1.3. <a name='Step3:DDLCode'></a>Step 3: DDL Code

this code is for creating the data definition for the table in big query after reading the data definition from oracle. Currently this happens with one table only. This is intended since currently we are doing the processing through 3 mechanisms- batch , streaming and striim.


####  1.3.1. <a name='CodeFolderStructure'></a> Code Folder Structure
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

####  1.3.2. <a name='Parameterstomainfile'></a>Parameters to main file

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


####  1.3.3. <a name='Calltofile'></a>Call to file

python ddl_main.py --< parameter name 1> < parameter value 1> --< parameter name 2> < parameter value 3>


###  1.4. <a name='Step4:Datatransfercode'></a>Step 4: Data transfer code

####  1.4.1. <a name='Codestructure'></a>Code structure

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


####  1.4.2. <a name='FileDescriptors'></a>File Descriptors

##### Json file
This is the json file containing the credentials for the google cloud project thats was downloaded in the setting up of google cloud project part.

##### orclbm_main.py

This collects argumnets from the user and inputs the same for the Beam batch project top run. The arguments are as follows

####  1.4.3. <a name='Parameterstomainfile-1'></a>Parameters to main file

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


####  1.4.4. <a name='Calltofile-1'></a>Call to file

```
python orclbm_main.py --< parameter name 1> < parameter value 1> --< parameter name 2> < parameter value 3>

```
Post completion of both steps now we know that both ddl and data transfer works now we connect to airflow. For airflow we need t change the codes a little bit which we will come to in due course.



##  2. <a name='Striim'></a>Striim

###  2.1. <a name='Step1:setupmachine'></a>Step 1: set up machine

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


##  3. <a name='ApacheBEAMstreaming'></a>Apache BEAM streaming

The Streaming processing has two aspects to it. 
1. the listener which runs continuous on a tablke tracking the additions to the table for a particular query and publishes this to the google cloud pub sub
2. The other part is the listener or subscriber which receives those changes and send them to bigquery

###  3.1. <a name='Setup'></a>Set up

For this setup we first go to google cloud pub/sub module and create a new topic which is exactly same as the oracle table name / big query table name. This is done for simplicity and is not a necessity.

###  3.2. <a name='Folderstructure'></a>Folder structure

.
├── BeamProjectV1-48b0a434a29a.json<br />
├── beamstreamingpubsubtobq.py<br />
├── orcltopubsub.json<br />
└── orcltopubsub.py<br />


###  3.3. <a name='Configurationforpublisherorcltopubsub.json'></a>Configuration for publisher (orcltopubsub.json)

please note that the json format is an array. so we can put multiple configurations in here. Which config to run is decided at runtime as a command line integer argument.

```
[
    {
        "connectstr" :"GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL",
        "queryfields" : ["ROWNUM"],
        "queryrel" : ["<"],
        "queryvals" : ["10"],
        "fields" :"*",
        "tname" : "GL_JE_LINES",
        "project_id" : "beamprojectv1",
        "topic_name" : "GL_JE_LINES",
        "gcred":"BeamProjectV1-48b0a434a29a.json"
    }
]
```
1. variable name : **connectstr**
   1. Default value: **GL/GL@orcl.c7y14itdrmil.eu-west-1.rds.amazonaws.com:1521/ORCL**
   2. What is it: **Oracle connection string using username and password**
2. variable name : **queryfields**
   1. Default value: **["ROWNUM"]**
   2. What is it: **these are the fields in the where or having clause of the sql used to pull the data or monitor the data for streaming**
3. variable name : **queryrel**
   1. Default value: **["<"]**
   2. What is it: **these are the relations of the corresponding fields in the where or having clause of the sql used to pull the data or monitor the data for streaming/ The values will be >/</=/>=/<=** 
4. variable name : **fields**
   1. Default value: *
   2. What is it: **these are the fields in the select query for the streaming pull** 
5. variable name : **tname**
   1. Default value: **GL_JE_LINES**
   2. What is it: **tablem name from which to pull the data or monitor in oracle** 
6. variable name : **project_id**
   1. Default value: **beamprojectv1**
   2. What is it: **default project in gcp**  
7. variable name : **topic_name**
   1. Default value: **GL_JE_LINES**
   2. What is it: **topic name created for this streaming job in GCP pubsub**
8. variable name : **gcred**
   1. Default value: **BeamProjectV1-48b0a434a29a.json**
   2. What is it: **path to google credentials**


###  3.4. <a name='Calltopublisher'></a>Call to publisher

```
python orcltopubsub.py 0
```
the 0 means to run the first configuration

###  3.5. <a name='Argumentsforsubscriberandstreamer'></a>Arguments for subscriber and streamer 

1. variable name : **gcred**
   1. Default value: **BeamProjectV1-48b0a434a29a.json**
   2. What is it: **path to google credentials**
2. variable name : **input_topic**
   1. Default value: **projects/beamprojectv1/topics/GL_JE_LINES**
   2. What is it: **topic name created for this streaming job in GCP pubsub Input PubSub topic of the form projects/< PROJECT >/topics/< TOPIC >**
3. variable name : **bqpid**
   1. Default value: **beamprojectv1**
   2. What is it: **default project in gcp**
4. variable name : **bqds**
   1. Default value: **AWSRDS_GL**
   2. What is it: **the dataset in bigquery**
5. variable name : **bqtbl**
   1. Default value: **GL_JE_LINES**
   2. What is it: **the table name in bigquery** 
6. variable name : **gdfjob**
   1. Default value: **myjob**
   2. What is it: **dataflow job name** 
7. variable name : **gbstaging**
   1. Default value: **gs://facbeambucketv1/staging**
   2. What is it: **Path to google staging storage** 
8. variable name : **gbtemp**
   1. Default value: **gs://facbeambucketv1/temp**
   2. What is it: **Path to google staging storage** 
9. variable name : **runner**
   1. Default value: **DirectRunner**
   2. What is it: **runner to use DirectRunner or DataflowRunner**  
10. variable name : **savesess**
   1. Default value: **True**
   2. What is it: **save main session**  

###  3.6. <a name='Calltosubscriberandstreamer'></a>Call to subscriber and streamer

python beamstreamingpubsubtobq.py --< parameter name 1> < parameter value 1> --< parameter name 2> < parameter value 3>

##  4. <a name='Step5:ApacheAirflowIntegration'></a>Step 5: Apache Airflow Integration

###  4.1. <a name='Installationandmachinesetup'></a>Installation and machine setup

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

###  4.2. <a name='DAG:BEAMBatchPrecessing'></a>DAG: BEAM Batch Precessing

1. Put all contents of your dag folder into /home/< username >/airflow/dags

contents of the dag folder is as follows

```
Dag
├── oracledagV9.py
├── BeamProjectV1-48b0a434a29a.json
└── orclbqfilesV9
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

2. in your browser now go to http:\\[gcp instance publlic IP]:8080\admin
3. Our dag has two tasks 
   1. creating the table definition or altering it
   2. data transfer to the table
4.  you should see your dag lloaded. If not please wait and refresh

![Alt text](images/dagmain.png?raw=true "Title")

![Alt text](images/dagtask.png?raw=true "Title")

the task has to turned on by the toggle swittch to the left.

5. To see the detailed status of the retries Please click on the dag name in the DAG column which will take you to the tree view which shows you what happened at every attempt

![Alt text](images/dagtasktree.png?raw=true "Title")

6. Each of the small oxes refer to a task retry. the significance of the colour of the boxes is given on the legend to the right. Clicking on one of them gives us the following windo on which we can monitor the logs  and has other options for rescheduling, remapping flow, ignoring unmet dependencies and so on


![Alt text](images/tasktretryopt.png?raw=true "Title")

7. finally we check if the task is actually  working in the big query query builder using the following query [Note this cchecks if the code is working at a broad level but doesnt show any issue that happened at a particular row. FOr this we must go through the logs] 

![Alt text](images/bq.png?raw=true "Title")

###  4.3. <a name='DAG:BEAMStreamPrecessing'></a>DAG: BEAM Stream Precessing

####  4.3.1. <a name='Folderstructure-1'></a>Folder structure
```
.dags
├── BeamProjectV1-48b0a434a29a.json
├── beamstreaming
│   ├── beamstreamingpubsubtobq.py
│   ├── orcltopubsub.json
│   └── orcltopubsub.py
├── oracletobqstramingdag.py
    ├── file.out
    ├── __init__.py
    ├── __init__.pyc
    ├── oracleddl.py
    ├── oracleddl.pyc
    ├── orclbm.py
    ├── orclbm.pyc
    └── __pycache__
        ├── __init__.cpython-37.pyc
        ├── oracleddl.cpython-37.pyc
```
###  4.4. <a name='RunonUI'></a>Run on UI

The rest of the process is similar to batch but the difference is that since this is a pub sub job, it actually never ends unlike batch unless its turned off.

##  5. <a name='Appendix'></a>Appendix

The google credentials json file needs to be present in 
1. the dags main folder
2. the ddl main folder
3. the orclbm main folder and the orclbm subfolder within orclbm
