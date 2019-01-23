CREATE TABLE gl_accts_map_seg1_gt (
	 source_flex_value VARCHAR2 (25) NOT NULL
	,target_flex_value VARCHAR2 (25) NOT NULL
	,summary_flag VARCHAR2 (1) NOT NULL
);

CREATE UNIQUE INDEX GL_ACCTS_MAP_SEG1_GT_U1 ON GL_ACCTS_MAP_SEG1_GT (SOURCE_FLEX_VALUE);
