CREATE TABLE gl_je_batches (
	 je_batch_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,set_of_books_id_11i NUMBER(15,0)
	,name VARCHAR2 (100) NOT NULL
	,status VARCHAR2 (1) NOT NULL
	,status_verified VARCHAR2 (1) NOT NULL
	,actual_flag VARCHAR2 (1) NOT NULL
	,default_effective_date DATE NOT NULL
	,budgetary_control_status VARCHAR2 (1) NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,status_reset_flag VARCHAR2 (1)
	,default_period_name VARCHAR2 (15)
	,unique_date VARCHAR2 (30)
	,earliest_postable_date DATE
	,posted_date DATE
	,date_created DATE
	,description VARCHAR2 (240)
	,control_total NUMBER
	,running_total_dr NUMBER
	,running_total_cr NUMBER
	,running_total_accounted_dr NUMBER
	,running_total_accounted_cr NUMBER
	,attribute1 VARCHAR2 (150)
	,attribute2 VARCHAR2 (150)
	,attribute3 VARCHAR2 (150)
	,attribute4 VARCHAR2 (150)
	,attribute5 VARCHAR2 (150)
	,attribute6 VARCHAR2 (150)
	,attribute7 VARCHAR2 (150)
	,attribute8 VARCHAR2 (150)
	,attribute9 VARCHAR2 (150)
	,attribute10 VARCHAR2 (150)
	,context VARCHAR2 (150)
	,packet_id NUMBER(15,0)
	,ussgl_transaction_code VARCHAR2 (30)
	,context2 VARCHAR2 (150)
	,posting_run_id NUMBER(15,0)
	,request_id NUMBER(15,0)
	,unreservation_packet_id NUMBER(15,0)
	,average_journal_flag VARCHAR2 (1) NOT NULL
	,org_id NUMBER(15,0)
	,approval_status_code VARCHAR2 (1) NOT NULL
	,parent_je_batch_id NUMBER(15,0)
	,posted_by NUMBER(15,0)
	,chart_of_accounts_id NUMBER(15,0) NOT NULL
	,period_set_name VARCHAR2 (15) NOT NULL
	,accounted_period_type VARCHAR2 (15) NOT NULL
	,group_id NUMBER
	,approver_employee_id NUMBER(15,0)
	,global_attribute_category VARCHAR2 (150)
	,global_attribute1 VARCHAR2 (150)
	,global_attribute2 VARCHAR2 (150)
	,global_attribute3 VARCHAR2 (150)
	,global_attribute4 VARCHAR2 (150)
	,global_attribute5 VARCHAR2 (150)
	,global_attribute6 VARCHAR2 (150)
	,global_attribute7 VARCHAR2 (150)
	,global_attribute8 VARCHAR2 (150)
	,global_attribute9 VARCHAR2 (150)
	,global_attribute10 VARCHAR2 (150)
	,global_attribute11 VARCHAR2 (150)
	,global_attribute12 VARCHAR2 (150)
	,global_attribute13 VARCHAR2 (150)
	,global_attribute14 VARCHAR2 (150)
	,global_attribute15 VARCHAR2 (150)
	,global_attribute16 VARCHAR2 (150)
	,global_attribute17 VARCHAR2 (150)
	,global_attribute18 VARCHAR2 (150)
	,global_attribute19 VARCHAR2 (150)
	,global_attribute20 VARCHAR2 (150)
);

CREATE  INDEX GL_JE_BATCHES_N1 ON GL_JE_BATCHES (STATUS);
CREATE UNIQUE INDEX GL_JE_BATCHES_U1 ON GL_JE_BATCHES (JE_BATCH_ID);
CREATE UNIQUE INDEX GL_JE_BATCHES_U2 ON GL_JE_BATCHES (NAME, DEFAULT_PERIOD_NAME, CHART_OF_ACCOUNTS_ID, PERIOD_SET_NAME, ACCOUNTED_PERIOD_TYPE);
