CREATE TABLE gl_access_sets (
	 access_set_id NUMBER(15,0) NOT NULL
	,name VARCHAR2 (30) NOT NULL
	,security_segment_code VARCHAR2 (1) NOT NULL
	,enabled_flag VARCHAR2 (1) NOT NULL
	,chart_of_accounts_id NUMBER(15,0) NOT NULL
	,period_set_name VARCHAR2 (15) NOT NULL
	,accounted_period_type VARCHAR2 (15) NOT NULL
	,automatically_created_flag VARCHAR2 (1) NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_update_login NUMBER(15,0)
	,created_by NUMBER(15,0) NOT NULL
	,creation_date DATE NOT NULL
	,secured_seg_value_set_id NUMBER(10,0)
	,default_ledger_id NUMBER(15,0)
	,description VARCHAR2 (240)
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

CREATE  INDEX GL_ACCESS_SETS_N1 ON GL_ACCESS_SETS (CHART_OF_ACCOUNTS_ID, PERIOD_SET_NAME, ACCOUNTED_PERIOD_TYPE);
CREATE  INDEX GL_ACCESS_SETS_N2 ON GL_ACCESS_SETS (SECURED_SEG_VALUE_SET_ID);
CREATE UNIQUE INDEX GL_ACCESS_SETS_U1 ON GL_ACCESS_SETS (ACCESS_SET_ID);
CREATE UNIQUE INDEX GL_ACCESS_SETS_U2 ON GL_ACCESS_SETS (NAME);
