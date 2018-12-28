CREATE TABLE fnd_flex_values (
	 flex_value_set_id NUMBER(10,0) NOT NULL
	,flex_value_id NUMBER(15,0) NOT NULL
	,flex_value VARCHAR2 (150) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0)
	,enabled_flag VARCHAR2 (1) NOT NULL
	,summary_flag VARCHAR2 (1) NOT NULL
	,start_date_active DATE
	,end_date_active DATE
	,parent_flex_value_low VARCHAR2 (60)
	,parent_flex_value_high VARCHAR2 (60)
	,structured_hierarchy_level NUMBER(15,0)
	,hierarchy_level VARCHAR2 (30)
	,compiled_value_attributes VARCHAR2 (2000)
	,value_category VARCHAR2 (30)
	,attribute1 VARCHAR2 (240)
	,attribute2 VARCHAR2 (240)
	,attribute3 VARCHAR2 (240)
	,attribute4 VARCHAR2 (240)
	,attribute5 VARCHAR2 (240)
	,attribute6 VARCHAR2 (240)
	,attribute7 VARCHAR2 (240)
	,attribute8 VARCHAR2 (240)
	,attribute9 VARCHAR2 (240)
	,attribute10 VARCHAR2 (240)
	,attribute11 VARCHAR2 (240)
	,attribute12 VARCHAR2 (240)
	,attribute13 VARCHAR2 (240)
	,attribute14 VARCHAR2 (240)
	,attribute15 VARCHAR2 (240)
	,attribute16 VARCHAR2 (240)
	,attribute17 VARCHAR2 (240)
	,attribute18 VARCHAR2 (240)
	,attribute19 VARCHAR2 (240)
	,attribute20 VARCHAR2 (240)
	,attribute21 VARCHAR2 (240)
	,attribute22 VARCHAR2 (240)
	,attribute23 VARCHAR2 (240)
	,attribute24 VARCHAR2 (240)
	,attribute25 VARCHAR2 (240)
	,attribute26 VARCHAR2 (240)
	,attribute27 VARCHAR2 (240)
	,attribute28 VARCHAR2 (240)
	,attribute29 VARCHAR2 (240)
	,attribute30 VARCHAR2 (240)
	,attribute31 VARCHAR2 (240)
	,attribute32 VARCHAR2 (240)
	,attribute33 VARCHAR2 (240)
	,attribute34 VARCHAR2 (240)
	,attribute35 VARCHAR2 (240)
	,attribute36 VARCHAR2 (240)
	,attribute37 VARCHAR2 (240)
	,attribute38 VARCHAR2 (240)
	,attribute39 VARCHAR2 (240)
	,attribute40 VARCHAR2 (240)
	,attribute41 VARCHAR2 (240)
	,attribute42 VARCHAR2 (240)
	,attribute43 VARCHAR2 (240)
	,attribute44 VARCHAR2 (240)
	,attribute45 VARCHAR2 (240)
	,attribute46 VARCHAR2 (240)
	,attribute47 VARCHAR2 (240)
	,attribute48 VARCHAR2 (240)
	,attribute49 VARCHAR2 (240)
	,attribute50 VARCHAR2 (240)
	,security_group_id NUMBER
	,attribute_sort_order NUMBER(15,0)
	,zd_edition_name VARCHAR2 (30) DEFAULT 'ORA$BASE' NOT NULL
	,zd_sync VARCHAR2 (30) DEFAULT 'SYNCED' NOT NULL
);

CREATE  INDEX FND_FLEX_VALUES_N1 ON FND_FLEX_VALUES (FLEX_VALUE_SET_ID, FLEX_VALUE);
CREATE  INDEX FND_FLEX_VALUES_N2 ON FND_FLEX_VALUES (FLEX_VALUE_SET_ID, STRUCTURED_HIERARCHY_LEVEL);
CREATE UNIQUE INDEX FND_FLEX_VALUES_U1 ON FND_FLEX_VALUES (FLEX_VALUE_ID, ZD_EDITION_NAME);
CREATE UNIQUE INDEX FND_FLEX_VALUES_U2 ON FND_FLEX_VALUES (FLEX_VALUE_SET_ID, PARENT_FLEX_VALUE_LOW, FLEX_VALUE, ZD_EDITION_NAME);
