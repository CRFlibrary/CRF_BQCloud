CREATE TABLE gl_access_set_assign_int (
	 access_set_id NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,segment_value VARCHAR2 (25) NOT NULL
	,access_privilege_code VARCHAR2 (1) NOT NULL
	,parent_record_id NUMBER(15,0) NOT NULL
	,status_code VARCHAR2 (1) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0) NOT NULL
	,start_date DATE
	,end_date DATE
);

CREATE UNIQUE INDEX GL_ACCESS_SET_ASSIGN_INT_U1 ON GL_ACCESS_SET_ASSIGN_INT (ACCESS_SET_ID, PARENT_RECORD_ID, LEDGER_ID, SEGMENT_VALUE, ACCESS_PRIVILEGE_CODE, STATUS_CODE, START_DATE, END_DATE);
