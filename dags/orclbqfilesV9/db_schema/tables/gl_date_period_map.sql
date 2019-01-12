CREATE TABLE gl_date_period_map (
	 period_set_name VARCHAR2 (15) NOT NULL
	,accounting_date DATE NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,period_type VARCHAR2 (15) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0) NOT NULL
);

CREATE  INDEX GL_DATE_PERIOD_MAP_N1 ON GL_DATE_PERIOD_MAP (PERIOD_SET_NAME, PERIOD_NAME);
CREATE UNIQUE INDEX GL_DATE_PERIOD_MAP_U1 ON GL_DATE_PERIOD_MAP (PERIOD_SET_NAME, PERIOD_TYPE, ACCOUNTING_DATE, PERIOD_NAME);
