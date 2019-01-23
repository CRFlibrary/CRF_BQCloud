CREATE TABLE gl_alloc_target_7367016 (
	 allocation_formula_id NUMBER(15,0) NOT NULL
	,request_id NUMBER(15,0) NOT NULL
	,entered_amount NUMBER NOT NULL
	,accounted_amount NUMBER NOT NULL
	,je_batch_id NUMBER(15,0) NOT NULL
	,je_header_id NUMBER(15,0) NOT NULL
	,je_line_num NUMBER(15,0) NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,accounting_date DATE NOT NULL
	,max_amount_flag VARCHAR2 (1)
	,description VARCHAR2 (240)
	,code_combination_id NUMBER(15,0)
	,message_number NUMBER(15,0)
	,line_type VARCHAR2 (1)
	,ledger_id NUMBER(15,0)
	,validation_error VARCHAR2 (30)
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
);

CREATE  INDEX GL_ALLOC_TARGET_7367016_N1 ON GL_ALLOC_TARGET_7367016 (JE_HEADER_ID);
CREATE  INDEX GL_ALLOC_TARGET_7367016_N2 ON GL_ALLOC_TARGET_7367016 (ALLOCATION_FORMULA_ID, JE_LINE_NUM);
