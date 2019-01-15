CREATE TABLE gl_budget_versions (
	 budget_version_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER NOT NULL
	,budget_type VARCHAR2 (15) NOT NULL
	,budget_name VARCHAR2 (15) NOT NULL
	,version_num VARCHAR2 (15) NOT NULL
	,status VARCHAR2 (1) NOT NULL
	,date_opened DATE NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,description VARCHAR2 (240)
	,date_active DATE
	,date_archived DATE
	,attribute1 VARCHAR2 (150)
	,attribute2 VARCHAR2 (150)
	,attribute3 VARCHAR2 (150)
	,attribute4 VARCHAR2 (150)
	,attribute5 VARCHAR2 (150)
	,attribute6 VARCHAR2 (150)
	,attribute7 VARCHAR2 (150)
	,attribute8 VARCHAR2 (150)
	,context VARCHAR2 (150)
	,control_budget_version_id NUMBER(15,0)
	,igi_bud_nyc_flag VARCHAR2 (1)
);

CREATE  INDEX GL_BUDGET_VERSIONS_N1 ON GL_BUDGET_VERSIONS (BUDGET_NAME, STATUS);
CREATE UNIQUE INDEX GL_BUDGET_VERSIONS_U1 ON GL_BUDGET_VERSIONS (BUDGET_VERSION_ID);
