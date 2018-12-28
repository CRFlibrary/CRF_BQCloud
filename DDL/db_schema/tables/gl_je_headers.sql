CREATE TABLE gl_je_headers (
	 je_header_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,je_category VARCHAR2 (25) NOT NULL
	,je_source VARCHAR2 (25) NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,name VARCHAR2 (100) NOT NULL
	,currency_code VARCHAR2 (15) NOT NULL
	,status VARCHAR2 (1) NOT NULL
	,date_created DATE NOT NULL
	,accrual_rev_flag VARCHAR2 (1) NOT NULL
	,multi_bal_seg_flag VARCHAR2 (1) NOT NULL
	,actual_flag VARCHAR2 (1) NOT NULL
	,default_effective_date DATE NOT NULL
	,conversion_flag VARCHAR2 (1)
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,encumbrance_type_id NUMBER(15,0)
	,budget_version_id NUMBER(15,0)
	,balanced_je_flag VARCHAR2 (1)
	,balancing_segment_value VARCHAR2 (25)
	,je_batch_id NUMBER(15,0)
	,from_recurring_header_id NUMBER(15,0)
	,unique_date VARCHAR2 (30)
	,earliest_postable_date DATE
	,posted_date DATE
	,accrual_rev_effective_date DATE
	,accrual_rev_period_name VARCHAR2 (15)
	,accrual_rev_status VARCHAR2 (1)
	,accrual_rev_je_header_id NUMBER(15,0)
	,accrual_rev_change_sign_flag VARCHAR2 (1) NOT NULL
	,description VARCHAR2 (240)
	,control_total NUMBER
	,running_total_dr NUMBER
	,running_total_cr NUMBER
	,running_total_accounted_dr NUMBER
	,running_total_accounted_cr NUMBER
	,currency_conversion_rate NUMBER
	,currency_conversion_type VARCHAR2 (30)
	,currency_conversion_date DATE
	,external_reference VARCHAR2 (80)
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
	,context VARCHAR2 (150)
	,ussgl_transaction_code VARCHAR2 (30)
	,context2 VARCHAR2 (150)
	,doc_sequence_id NUMBER
	,doc_sequence_value NUMBER
	,jgzz_recon_context VARCHAR2 (30)
	,jgzz_recon_ref VARCHAR2 (240)
	,global_attribute_category VARCHAR2 (30)
	,global_attribute1 VARCHAR2 (150)
	,global_attribute2 VARCHAR2 (150)
	,global_attribute3 VARCHAR2 (150)
	,global_attribute4 VARCHAR2 (150)
	,global_attribute5 VARCHAR2 (150)
	,global_attribute6 VARCHAR2 (150)
	,global_attribute7 VARCHAR2 (150)
	,global_attribute8 VARCHAR2 (150)
	,global_attribute9 VARCHAR2 (150)
	,global_attribute10 VARCHAR2 (150)
	,tax_status_code VARCHAR2 (1) NOT NULL
	,parent_je_header_id NUMBER(15,0)
	,reversed_je_header_id NUMBER(15,0)
	,originating_bal_seg_value VARCHAR2 (25)
	,intercompany_mode NUMBER(15,0)
	,dr_bal_seg_value VARCHAR2 (25)
	,cr_bal_seg_value VARCHAR2 (25)
	,reference_date DATE
	,local_doc_sequence_id NUMBER
	,local_doc_sequence_value NUMBER
	,display_alc_journal_flag VARCHAR2 (1)
	,je_from_sla_flag VARCHAR2 (1)
	,posting_acct_seq_version_id NUMBER
	,posting_acct_seq_assign_id NUMBER
	,posting_acct_seq_value NUMBER
	,close_acct_seq_version_id NUMBER
	,close_acct_seq_assign_id NUMBER
	,close_acct_seq_value NUMBER
);

CREATE  INDEX GL_JE_HEADERS_N1 ON GL_JE_HEADERS (JE_BATCH_ID);
CREATE  INDEX GL_JE_HEADERS_N2 ON GL_JE_HEADERS (PERIOD_NAME, JE_CATEGORY);
CREATE  INDEX GL_JE_HEADERS_N3 ON GL_JE_HEADERS (DOC_SEQUENCE_VALUE, DOC_SEQUENCE_ID);
CREATE  INDEX GL_JE_HEADERS_N4 ON GL_JE_HEADERS (PARENT_JE_HEADER_ID);
CREATE UNIQUE INDEX GL_JE_HEADERS_U1 ON GL_JE_HEADERS (JE_HEADER_ID);
CREATE UNIQUE INDEX GL_JE_HEADERS_U2 ON GL_JE_HEADERS (NAME, JE_BATCH_ID);
