CREATE TABLE gl_accts_map_int_gt (
	 coa_mapping_id NUMBER(15,0) NOT NULL
	,from_ccid NUMBER(15,0) NOT NULL
	,from_summary_flag VARCHAR2 (1)
	,to_ccid NUMBER(15,0)
	,to_segment1 VARCHAR2 (25)
	,to_segment2 VARCHAR2 (25)
	,to_segment3 VARCHAR2 (25)
	,to_segment4 VARCHAR2 (25)
	,to_segment5 VARCHAR2 (25)
	,to_segment6 VARCHAR2 (25)
	,to_segment7 VARCHAR2 (25)
	,to_segment8 VARCHAR2 (25)
	,to_segment9 VARCHAR2 (25)
	,to_segment10 VARCHAR2 (25)
	,to_segment11 VARCHAR2 (25)
	,to_segment12 VARCHAR2 (25)
	,to_segment13 VARCHAR2 (25)
	,to_segment14 VARCHAR2 (25)
	,to_segment15 VARCHAR2 (25)
	,to_segment16 VARCHAR2 (25)
	,to_segment17 VARCHAR2 (25)
	,to_segment18 VARCHAR2 (25)
	,to_segment19 VARCHAR2 (25)
	,to_segment20 VARCHAR2 (25)
	,to_segment21 VARCHAR2 (25)
	,to_segment22 VARCHAR2 (25)
	,to_segment23 VARCHAR2 (25)
	,to_segment24 VARCHAR2 (25)
	,to_segment25 VARCHAR2 (25)
	,to_segment26 VARCHAR2 (25)
	,to_segment27 VARCHAR2 (25)
	,to_segment28 VARCHAR2 (25)
	,to_segment29 VARCHAR2 (25)
	,to_segment30 VARCHAR2 (25)
	,error_code VARCHAR2 (30)
);

CREATE UNIQUE INDEX GL_ACCTS_MAP_INT_GT_U1 ON GL_ACCTS_MAP_INT_GT (COA_MAPPING_ID, FROM_CCID);
