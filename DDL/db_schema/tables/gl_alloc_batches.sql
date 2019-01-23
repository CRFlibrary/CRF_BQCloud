CREATE TABLE gl_alloc_batches (
	 allocation_batch_id NUMBER(15,0) NOT NULL
	,name VARCHAR2 (39) NOT NULL
	,chart_of_accounts_id NUMBER(15,0) NOT NULL
	,validation_status VARCHAR2 (1) NOT NULL
	,actual_flag VARCHAR2 (1) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
	,validation_request_id NUMBER(15,0)
	,description VARCHAR2 (240)
	,security_flag VARCHAR2 (1) NOT NULL
);
