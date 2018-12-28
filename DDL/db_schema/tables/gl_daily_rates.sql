CREATE TABLE gl_daily_rates (
	 from_currency VARCHAR2 (15) NOT NULL
	,to_currency VARCHAR2 (15) NOT NULL
	,conversion_date DATE NOT NULL
	,conversion_type VARCHAR2 (30) NOT NULL
	,conversion_rate NUMBER NOT NULL
	,status_code VARCHAR2 (1) NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0) NOT NULL
	,context VARCHAR2 (150)
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
	,rate_source_code VARCHAR2 (15)
);

CREATE UNIQUE INDEX GL_DAILY_RATES_U1 ON GL_DAILY_RATES (FROM_CURRENCY, TO_CURRENCY, CONVERSION_DATE, CONVERSION_TYPE);
