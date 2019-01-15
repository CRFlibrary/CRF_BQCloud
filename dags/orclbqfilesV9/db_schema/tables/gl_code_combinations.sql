CREATE TABLE gl_code_combinations (
	 code_combination_id NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER NOT NULL
	,chart_of_accounts_id NUMBER(15,0) NOT NULL
	,detail_posting_allowed_flag VARCHAR2 (1) NOT NULL
	,detail_budgeting_allowed_flag VARCHAR2 (1) NOT NULL
	,account_type VARCHAR2 (1) NOT NULL
	,enabled_flag VARCHAR2 (1) NOT NULL
	,summary_flag VARCHAR2 (1) NOT NULL
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
	,description VARCHAR2 (240)
	,template_id NUMBER(15,0)
	,allocation_create_flag VARCHAR2 (1)
	,start_date_active DATE
	,end_date_active DATE
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
	,segment_attribute1 VARCHAR2 (60)
	,segment_attribute2 VARCHAR2 (60)
	,segment_attribute3 VARCHAR2 (60)
	,segment_attribute4 VARCHAR2 (60)
	,segment_attribute5 VARCHAR2 (60)
	,segment_attribute6 VARCHAR2 (60)
	,segment_attribute7 VARCHAR2 (60)
	,segment_attribute8 VARCHAR2 (60)
	,segment_attribute9 VARCHAR2 (60)
	,segment_attribute10 VARCHAR2 (60)
	,segment_attribute11 VARCHAR2 (60)
	,segment_attribute12 VARCHAR2 (60)
	,segment_attribute13 VARCHAR2 (60)
	,segment_attribute14 VARCHAR2 (60)
	,segment_attribute15 VARCHAR2 (60)
	,segment_attribute16 VARCHAR2 (60)
	,segment_attribute17 VARCHAR2 (60)
	,segment_attribute18 VARCHAR2 (60)
	,segment_attribute19 VARCHAR2 (60)
	,segment_attribute20 VARCHAR2 (60)
	,segment_attribute21 VARCHAR2 (60)
	,segment_attribute22 VARCHAR2 (60)
	,segment_attribute23 VARCHAR2 (60)
	,segment_attribute24 VARCHAR2 (60)
	,segment_attribute25 VARCHAR2 (60)
	,segment_attribute26 VARCHAR2 (60)
	,segment_attribute27 VARCHAR2 (60)
	,segment_attribute28 VARCHAR2 (60)
	,segment_attribute29 VARCHAR2 (60)
	,segment_attribute30 VARCHAR2 (60)
	,segment_attribute31 VARCHAR2 (60)
	,segment_attribute32 VARCHAR2 (60)
	,segment_attribute33 VARCHAR2 (60)
	,segment_attribute34 VARCHAR2 (60)
	,segment_attribute35 VARCHAR2 (60)
	,segment_attribute36 VARCHAR2 (60)
	,segment_attribute37 VARCHAR2 (60)
	,segment_attribute38 VARCHAR2 (60)
	,segment_attribute39 VARCHAR2 (60)
	,segment_attribute40 VARCHAR2 (60)
	,segment_attribute41 VARCHAR2 (60)
	,segment_attribute42 VARCHAR2 (60)
	,jgzz_recon_flag VARCHAR2 (1)
	,jgzz_recon_context VARCHAR2 (30)
	,reference1 VARCHAR2 (1)
	,reference2 VARCHAR2 (1)
	,reference3 VARCHAR2 (25)
	,reference4 VARCHAR2 (1)
	,reference5 VARCHAR2 (1)
	,preserve_flag VARCHAR2 (1)
	,refresh_flag VARCHAR2 (1)
	,igi_balanced_budget_flag VARCHAR2 (1)
	,company_cost_center_org_id NUMBER(15,0)
	,revaluation_id NUMBER(15,0)
	,ledger_segment VARCHAR2 (20)
	,ledger_type_code VARCHAR2 (1)
	,alternate_code_combination_id NUMBER(15,0)
);

CREATE  INDEX GL_CODE_COMBINATIONS_N1 ON GL_CODE_COMBINATIONS (SEGMENT1);
CREATE  INDEX GL_CODE_COMBINATIONS_N10 ON GL_CODE_COMBINATIONS (SEGMENT10);
CREATE  INDEX GL_CODE_COMBINATIONS_N11 ON GL_CODE_COMBINATIONS (SEGMENT11);
CREATE  INDEX GL_CODE_COMBINATIONS_N12 ON GL_CODE_COMBINATIONS (SEGMENT12);
CREATE  INDEX GL_CODE_COMBINATIONS_N2 ON GL_CODE_COMBINATIONS (SEGMENT2);
CREATE  INDEX GL_CODE_COMBINATIONS_N3 ON GL_CODE_COMBINATIONS (SEGMENT3);
CREATE  INDEX GL_CODE_COMBINATIONS_N31 ON GL_CODE_COMBINATIONS (TEMPLATE_ID);
CREATE  INDEX GL_CODE_COMBINATIONS_N4 ON GL_CODE_COMBINATIONS (SEGMENT4);
CREATE  INDEX GL_CODE_COMBINATIONS_N5 ON GL_CODE_COMBINATIONS (SEGMENT5);
CREATE  INDEX GL_CODE_COMBINATIONS_N6 ON GL_CODE_COMBINATIONS (SEGMENT6);
CREATE  INDEX GL_CODE_COMBINATIONS_N7 ON GL_CODE_COMBINATIONS (SEGMENT7);
CREATE  INDEX GL_CODE_COMBINATIONS_N8 ON GL_CODE_COMBINATIONS (SEGMENT8);
CREATE  INDEX GL_CODE_COMBINATIONS_N9 ON GL_CODE_COMBINATIONS (SEGMENT9);
CREATE UNIQUE INDEX GL_CODE_COMBINATIONS_U1 ON GL_CODE_COMBINATIONS (CODE_COMBINATION_ID);
