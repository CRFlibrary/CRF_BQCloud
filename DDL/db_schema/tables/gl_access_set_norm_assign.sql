CREATE TABLE gl_access_set_norm_assign (
	 access_set_id NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,all_segment_value_flag VARCHAR2 (1) NOT NULL
	,segment_value_type_code VARCHAR2 (1) NOT NULL
	,access_privilege_code VARCHAR2 (1) NOT NULL
	,record_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,segment_value VARCHAR2 (25)
	,start_date DATE
	,end_date DATE
	,status_code VARCHAR2 (1)
	,link_id NUMBER(15,0)
	,request_id NUMBER(15,0)
	,context VARCHAR2 (150)
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
	,attribute11 VARCHAR2 (150)
	,attribute12 VARCHAR2 (150)
	,attribute13 VARCHAR2 (150)
	,attribute14 VARCHAR2 (150)
	,attribute15 VARCHAR2 (150)
);

CREATE  INDEX GL_ACCESS_SET_NORM_ASSIGN_N1 ON GL_ACCESS_SET_NORM_ASSIGN (ACCESS_SET_ID, SEGMENT_VALUE);
