CREATE TABLE gl_alloc_formulas (
	 allocation_formula_id NUMBER(15,0) NOT NULL
	,allocation_batch_id NUMBER(15,0) NOT NULL
	,name VARCHAR2 (39) NOT NULL
	,run_sequence NUMBER(6,0) NOT NULL
	,je_category_name VARCHAR2 (25) NOT NULL
	,full_allocation_flag VARCHAR2 (1) NOT NULL
	,validation_status VARCHAR2 (1) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,creation_date DATE
	,created_by NUMBER(15,0)
	,last_update_login NUMBER(15,0)
	,description VARCHAR2 (240)
	,conversion_method_code VARCHAR2 (2) NOT NULL
	,currency_conversion_type VARCHAR2 (30)
);
