CREATE TABLE gl_budget_types (
	 budget_type VARCHAR2 (15) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,audit_trail_flag VARCHAR2 (1) NOT NULL
	,description VARCHAR2 (240)
	,attribute1 VARCHAR2 (150)
	,attribute2 VARCHAR2 (150)
	,attribute3 VARCHAR2 (150)
	,attribute4 VARCHAR2 (150)
	,attribute5 VARCHAR2 (150)
	,context VARCHAR2 (150)
);

CREATE UNIQUE INDEX GL_BUDGET_TYPES_U1 ON GL_BUDGET_TYPES (BUDGET_TYPE);
