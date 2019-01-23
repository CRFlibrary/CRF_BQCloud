CREATE TABLE gl_alloc_history (
	 allocation_batch_id NUMBER(15,0) NOT NULL
	,name VARCHAR2 (39) NOT NULL
	,set_of_books_id_11i NUMBER(15,0)
	,request_id NUMBER(15,0) NOT NULL
	,run_status VARCHAR2 (1) NOT NULL
	,from_period_name VARCHAR2 (15) NOT NULL
	,to_period_name VARCHAR2 (15) NOT NULL
	,to_period_num NUMBER(15,0) NOT NULL
	,to_period_year NUMBER(15,0) NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,creation_date DATE NOT NULL
	,last_update_login NUMBER(15,0)
	,journal_effective_date DATE
	,calculation_effective_date DATE
	,access_set_id NUMBER(15,0)
);
