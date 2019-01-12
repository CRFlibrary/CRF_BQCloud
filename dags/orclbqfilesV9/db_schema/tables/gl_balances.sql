CREATE TABLE gl_balances (
	 ledger_id NUMBER(15,0) NOT NULL
	,code_combination_id NUMBER(15,0) NOT NULL
	,currency_code VARCHAR2 (15) NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,actual_flag VARCHAR2 (1) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,budget_version_id NUMBER(15,0)
	,encumbrance_type_id NUMBER(15,0)
	,translated_flag VARCHAR2 (1)
	,revaluation_status VARCHAR2 (1)
	,period_type VARCHAR2 (15)
	,period_year NUMBER(15,0)
	,period_num NUMBER(15,0)
	,period_net_dr NUMBER
	,period_net_cr NUMBER
	,period_to_date_adb NUMBER
	,quarter_to_date_dr NUMBER
	,quarter_to_date_cr NUMBER
	,quarter_to_date_adb NUMBER
	,year_to_date_adb NUMBER
	,project_to_date_dr NUMBER
	,project_to_date_cr NUMBER
	,project_to_date_adb NUMBER
	,begin_balance_dr NUMBER
	,begin_balance_cr NUMBER
	,period_net_dr_beq NUMBER
	,period_net_cr_beq NUMBER
	,begin_balance_dr_beq NUMBER
	,begin_balance_cr_beq NUMBER
	,template_id NUMBER(15,0)
	,encumbrance_doc_id NUMBER(15,0)
	,encumbrance_line_num NUMBER(15,0)
	,quarter_to_date_dr_beq NUMBER
	,quarter_to_date_cr_beq NUMBER
	,project_to_date_dr_beq NUMBER
	,project_to_date_cr_beq NUMBER
);

CREATE  INDEX GL_BALANCES_N1 ON GL_BALANCES (CODE_COMBINATION_ID, PERIOD_NAME);
CREATE  INDEX GL_BALANCES_N2 ON GL_BALANCES (PERIOD_NAME);
CREATE  INDEX GL_BALANCES_N3 ON GL_BALANCES (PERIOD_NUM, PERIOD_YEAR);
