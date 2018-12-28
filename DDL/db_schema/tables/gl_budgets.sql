CREATE TABLE gl_budgets (
	 budget_type VARCHAR2 (15) NOT NULL
	,budget_name VARCHAR2 (15) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,status VARCHAR2 (1) NOT NULL
	,date_created DATE NOT NULL
	,require_budget_journals_flag VARCHAR2 (1) NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,current_version_id NUMBER(15,0)
	,latest_opened_year NUMBER(15,0)
	,first_valid_period_name VARCHAR2 (15)
	,last_valid_period_name VARCHAR2 (15)
	,description VARCHAR2 (240)
	,date_closed DATE
	,attribute1 VARCHAR2 (150)
	,attribute2 VARCHAR2 (150)
	,attribute3 VARCHAR2 (150)
	,attribute4 VARCHAR2 (150)
	,attribute5 VARCHAR2 (150)
	,attribute6 VARCHAR2 (150)
	,attribute7 VARCHAR2 (150)
	,attribute8 VARCHAR2 (150)
	,context VARCHAR2 (150)
);

CREATE UNIQUE INDEX GL_BUDGETS_U1 ON GL_BUDGETS (BUDGET_NAME, BUDGET_TYPE);
