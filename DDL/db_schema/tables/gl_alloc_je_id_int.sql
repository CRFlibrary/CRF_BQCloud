CREATE TABLE gl_alloc_je_id_int (
	 allocation_batch_id NUMBER(15,0) NOT NULL
	,allocation_formula_id NUMBER(15,0) NOT NULL
	,ledger_id NUMBER(15,0) NOT NULL
	,line_type VARCHAR2 (1) NOT NULL
	,je_id NUMBER(15,0) NOT NULL
	,currency_conversion_type VARCHAR2 (30)
	,currency_conversion_rate NUMBER
);
