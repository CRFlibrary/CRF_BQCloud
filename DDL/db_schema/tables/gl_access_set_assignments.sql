CREATE TABLE gl_access_set_assignments (
	 access_set_id NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,segment_value VARCHAR2 (25) NOT NULL
	,access_privilege_code VARCHAR2 (1) NOT NULL
	,parent_record_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,start_date DATE
	,end_date DATE
);

CREATE  INDEX GL_ACCESS_SET_ASSIGNMENTS_N1 ON GL_ACCESS_SET_ASSIGNMENTS (ACCESS_SET_ID, LEDGER_ID);
CREATE  INDEX GL_ACCESS_SET_ASSIGNMENTS_N2 ON GL_ACCESS_SET_ASSIGNMENTS (ACCESS_SET_ID, SEGMENT_VALUE);
