CREATE TABLE gl_alloc_formula_lines (
	 allocation_formula_id NUMBER(15,0) NOT NULL
	,line_number NUMBER(15,0) NOT NULL
	,line_type VARCHAR2 (1) NOT NULL
	,operator VARCHAR2 (3) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,amount NUMBER
	,relative_period VARCHAR2 (25)
	,period_name VARCHAR2 (15)
	,currency_code VARCHAR2 (15)
	,transaction_currency_11i VARCHAR2 (1)
	,actual_flag VARCHAR2 (1)
	,budget_version_id NUMBER(15,0)
	,encumbrance_type_id NUMBER(15,0)
	,amount_type VARCHAR2 (15)
	,segment_types_key VARCHAR2 (60)
	,segment_break_key VARCHAR2 (60)
	,segment1 VARCHAR2 (25)
	,segment2 VARCHAR2 (25)
	,segment3 VARCHAR2 (25)
	,segment4 VARCHAR2 (25)
	,segment5 VARCHAR2 (25)
	,segment6 VARCHAR2 (25)
	,segment7 VARCHAR2 (25)
	,segment8 VARCHAR2 (25)
	,segment9 VARCHAR2 (25)
	,segment10 VARCHAR2 (25)
	,segment11 VARCHAR2 (25)
	,segment12 VARCHAR2 (25)
	,segment13 VARCHAR2 (25)
	,segment14 VARCHAR2 (25)
	,segment15 VARCHAR2 (25)
	,segment16 VARCHAR2 (25)
	,segment17 VARCHAR2 (25)
	,segment18 VARCHAR2 (25)
	,segment19 VARCHAR2 (25)
	,segment20 VARCHAR2 (25)
	,segment21 VARCHAR2 (25)
	,segment22 VARCHAR2 (25)
	,segment23 VARCHAR2 (25)
	,segment24 VARCHAR2 (25)
	,segment25 VARCHAR2 (25)
	,segment26 VARCHAR2 (25)
	,segment27 VARCHAR2 (25)
	,segment28 VARCHAR2 (25)
	,segment29 VARCHAR2 (25)
	,segment30 VARCHAR2 (25)
	,currency_type VARCHAR2 (1)
	,transaction_currency VARCHAR2 (30) NOT NULL
	,entered_currency VARCHAR2 (15)
	,ledger_currency VARCHAR2 (15)
	,ledger_id NUMBER(15,0)
	,ledger_action_code VARCHAR2 (1)
);
