CREATE TABLE gl_je_lines (
	 je_header_id NUMBER(15,0) NOT NULL
	,je_line_num NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,code_combination_id NUMBER(15,0) NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,effective_date DATE NOT NULL
	,status VARCHAR2 (1) NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,entered_dr NUMBER
	,entered_cr NUMBER
	,accounted_dr NUMBER
	,accounted_cr NUMBER
	,description VARCHAR2 (240)
	,reference_1 VARCHAR2 (240)
	,reference_2 VARCHAR2 (240)
	,reference_3 VARCHAR2 (240)
	,reference_4 VARCHAR2 (240)
	,reference_5 VARCHAR2 (240)
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
	,attribute16 VARCHAR2 (150)
	,attribute17 VARCHAR2 (150)
	,attribute18 VARCHAR2 (150)
	,attribute19 VARCHAR2 (150)
	,attribute20 VARCHAR2 (150)
	,context VARCHAR2 (150)
	,context2 VARCHAR2 (150)
	,invoice_date DATE
	,tax_code VARCHAR2 (15)
	,invoice_identifier VARCHAR2 (20)
	,invoice_amount NUMBER
	,no1 VARCHAR2 (150)
	,stat_amount NUMBER
	,ignore_rate_flag VARCHAR2 (1)
	,context3 VARCHAR2 (150)
	,ussgl_transaction_code VARCHAR2 (30)
	,subledger_doc_sequence_id NUMBER
	,context4 VARCHAR2 (150)
	,subledger_doc_sequence_value NUMBER
	,reference_6 VARCHAR2 (240)
	,reference_7 VARCHAR2 (240)
	,reference_8 VARCHAR2 (240)
	,reference_9 VARCHAR2 (240)
	,reference_10 VARCHAR2 (240)
	,jgzz_recon_status_11i VARCHAR2 (1)
	,jgzz_recon_date_11i DATE
	,jgzz_recon_id_11i NUMBER
	,jgzz_recon_ref_11i VARCHAR2 (240)
	,jgzz_recon_context_11i VARCHAR2 (30)
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
	,taxable_line_flag VARCHAR2 (1)
	,tax_type_code VARCHAR2 (1)
	,tax_code_id NUMBER(15,0)
	,tax_rounding_rule_code VARCHAR2 (1)
	,amount_includes_tax_flag VARCHAR2 (1)
	,tax_document_identifier VARCHAR2 (50)
	,tax_document_date DATE
	,tax_customer_name VARCHAR2 (240)
	,tax_customer_reference VARCHAR2 (240)
	,tax_registration_number VARCHAR2 (50)
	,tax_line_flag VARCHAR2 (1)
	,tax_group_id NUMBER(15,0)
	,line_type_code VARCHAR2 (20)
	,gl_sl_link_id NUMBER
	,gl_sl_link_table VARCHAR2 (30)
	,co_third_party VARCHAR2 (14)
	,co_processed_flag VARCHAR2 (1)
);

CREATE  INDEX GL_JE_LINES_N1 ON GL_JE_LINES (CODE_COMBINATION_ID, PERIOD_NAME);
CREATE  INDEX GL_JE_LINES_N3 ON GL_JE_LINES (SUBLEDGER_DOC_SEQUENCE_VALUE, SUBLEDGER_DOC_SEQUENCE_ID);
CREATE UNIQUE INDEX GL_JE_LINES_U1 ON GL_JE_LINES (JE_HEADER_ID, JE_LINE_NUM);
