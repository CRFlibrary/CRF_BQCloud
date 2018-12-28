CREATE TABLE gl_ledgers (
	 ledger_id NUMBER(15,0) NOT NULL
	,name VARCHAR2 (30) NOT NULL
	,short_name VARCHAR2 (20) NOT NULL
	,description VARCHAR2 (240)
	,ledger_category_code VARCHAR2 (30) NOT NULL
	,alc_ledger_type_code VARCHAR2 (30) NOT NULL
	,object_type_code VARCHAR2 (1) NOT NULL
	,le_ledger_type_code VARCHAR2 (1) NOT NULL
	,completion_status_code VARCHAR2 (30)
	,configuration_id NUMBER(15,0)
	,chart_of_accounts_id NUMBER(15,0) NOT NULL
	,currency_code VARCHAR2 (15) NOT NULL
	,period_set_name VARCHAR2 (15) NOT NULL
	,accounted_period_type VARCHAR2 (15) NOT NULL
	,first_ledger_period_name VARCHAR2 (15) NOT NULL
	,ret_earn_code_combination_id NUMBER(15,0) NOT NULL
	,suspense_allowed_flag VARCHAR2 (1) NOT NULL
	,allow_intercompany_post_flag VARCHAR2 (1) NOT NULL
	,track_rounding_imbalance_flag VARCHAR2 (1) NOT NULL
	,enable_average_balances_flag VARCHAR2 (1) NOT NULL
	,cum_trans_code_combination_id NUMBER(15,0)
	,res_encumb_code_combination_id NUMBER(15,0)
	,net_income_code_combination_id NUMBER(15,0)
	,rounding_code_combination_id NUMBER(15,0)
	,enable_budgetary_control_flag VARCHAR2 (1) NOT NULL
	,require_budget_journals_flag VARCHAR2 (1) NOT NULL
	,enable_je_approval_flag VARCHAR2 (1) NOT NULL
	,enable_automatic_tax_flag VARCHAR2 (1) NOT NULL
	,consolidation_ledger_flag VARCHAR2 (1) NOT NULL
	,translate_eod_flag VARCHAR2 (1) NOT NULL
	,translate_qatd_flag VARCHAR2 (1) NOT NULL
	,translate_yatd_flag VARCHAR2 (1) NOT NULL
	,transaction_calendar_id NUMBER(15,0)
	,daily_translation_rate_type VARCHAR2 (30)
	,automatically_created_flag VARCHAR2 (1) NOT NULL
	,bal_seg_value_option_code VARCHAR2 (1) NOT NULL
	,bal_seg_column_name VARCHAR2 (25) NOT NULL
	,mgt_seg_value_option_code VARCHAR2 (1) NOT NULL
	,mgt_seg_column_name VARCHAR2 (25)
	,bal_seg_value_set_id NUMBER(10,0) NOT NULL
	,mgt_seg_value_set_id NUMBER(10,0)
	,implicit_access_set_id NUMBER(15,0)
	,criteria_set_id NUMBER(15,0)
	,future_enterable_periods_limit NUMBER(15,0) NOT NULL
	,ledger_attributes VARCHAR2 (2000) NOT NULL
	,implicit_ledger_set_id NUMBER(15,0)
	,latest_opened_period_name VARCHAR2 (15)
	,latest_encumbrance_year NUMBER(15,0)
	,period_average_rate_type VARCHAR2 (30)
	,period_end_rate_type VARCHAR2 (30)
	,budget_period_avg_rate_type VARCHAR2 (30)
	,budget_period_end_rate_type VARCHAR2 (30)
	,sla_accounting_method_code VARCHAR2 (30)
	,sla_accounting_method_type VARCHAR2 (1)
	,sla_description_language VARCHAR2 (15)
	,sla_entered_cur_bal_sus_ccid NUMBER(15,0)
	,sla_sequencing_flag VARCHAR2 (1)
	,sla_bal_by_ledger_curr_flag VARCHAR2 (1)
	,sla_ledger_cur_bal_sus_ccid NUMBER(15,0)
	,enable_secondary_track_flag VARCHAR2 (1)
	,enable_reval_ss_track_flag VARCHAR2 (1)
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
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
	,enable_reconciliation_flag VARCHAR2 (1) NOT NULL
	,create_je_flag VARCHAR2 (1) NOT NULL
	,sla_ledger_cash_basis_flag VARCHAR2 (1)
	,complete_flag VARCHAR2 (1)
	,commitment_budget_flag VARCHAR2 (1)
	,net_closing_bal_flag VARCHAR2 (1) NOT NULL
	,automate_sec_jrnl_rev_flag VARCHAR2 (1)
);

CREATE  INDEX GL_LEDGERS_N1 ON GL_LEDGERS (CHART_OF_ACCOUNTS_ID, PERIOD_SET_NAME, ACCOUNTED_PERIOD_TYPE);
CREATE  INDEX GL_LEDGERS_N2 ON GL_LEDGERS (BAL_SEG_VALUE_SET_ID);
CREATE  INDEX GL_LEDGERS_N3 ON GL_LEDGERS (MGT_SEG_VALUE_SET_ID);
CREATE UNIQUE INDEX GL_LEDGERS_U1 ON GL_LEDGERS (NAME);
CREATE UNIQUE INDEX GL_LEDGERS_U2 ON GL_LEDGERS (LEDGER_ID);
CREATE UNIQUE INDEX GL_LEDGERS_U3 ON GL_LEDGERS (SHORT_NAME);
