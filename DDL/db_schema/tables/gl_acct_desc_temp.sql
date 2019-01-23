CREATE TABLE gl_acct_desc_temp (
	 segment_name VARCHAR2 (30)
	,display_flag VARCHAR2 (1)
	,id_flex_num NUMBER(15,0)
	,application_col_name VARCHAR2 (10) NOT NULL
	,flex_value_set_id NUMBER(10,0) NOT NULL
	,seg_sequence_num NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
);

CREATE UNIQUE INDEX GL_ACCT_DESC_TEMP_U1 ON GL_ACCT_DESC_TEMP (SEG_SEQUENCE_NUM, APPLICATION_COL_NAME);
