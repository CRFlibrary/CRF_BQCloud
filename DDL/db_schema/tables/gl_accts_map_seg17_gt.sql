CREATE TABLE gl_accts_map_seg17_gt (
	 source_flex_value VARCHAR2 (25) NOT NULL
	,target_flex_value VARCHAR2 (25) NOT NULL
	,summary_flag VARCHAR2 (1) NOT NULL
);

CREATE UNIQUE INDEX GL_ACCTS_MAP_SEG17_GT_U1 ON GL_ACCTS_MAP_SEG17_GT (SOURCE_FLEX_VALUE);
