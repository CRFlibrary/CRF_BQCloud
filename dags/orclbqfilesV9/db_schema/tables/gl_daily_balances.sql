CREATE TABLE gl_daily_balances (
	 ledger_id NUMBER(15,0) NOT NULL
	,code_combination_id NUMBER(15,0) NOT NULL
	,currency_code VARCHAR2 (15) NOT NULL
	,currency_type VARCHAR2 (1) NOT NULL
	,actual_flag VARCHAR2 (1) NOT NULL
	,period_name VARCHAR2 (15) NOT NULL
	,period_start_date DATE NOT NULL
	,period_end_date DATE NOT NULL
	,quarter_start_date DATE NOT NULL
	,year_start_date DATE NOT NULL
	,creation_date DATE NOT NULL
	,created_by NUMBER(15,0) NOT NULL
	,last_update_date DATE NOT NULL
	,last_updated_by NUMBER(15,0) NOT NULL
	,last_update_login NUMBER(15,0) NOT NULL
	,converted_from_currency VARCHAR2 (15)
	,period_type VARCHAR2 (15)
	,period_year NUMBER(15,0)
	,period_num NUMBER(15,0)
	,template_id NUMBER(15,0)
	,opening_quarter_aggregate NUMBER
	,opening_year_aggregate NUMBER
	,period_aggregate1 NUMBER
	,period_aggregate2 NUMBER
	,period_aggregate3 NUMBER
	,period_aggregate4 NUMBER
	,period_aggregate5 NUMBER
	,period_aggregate6 NUMBER
	,period_aggregate7 NUMBER
	,period_aggregate8 NUMBER
	,period_aggregate9 NUMBER
	,period_aggregate10 NUMBER
	,period_aggregate11 NUMBER
	,period_aggregate12 NUMBER
	,period_aggregate13 NUMBER
	,period_aggregate14 NUMBER
	,period_aggregate15 NUMBER
	,period_aggregate16 NUMBER
	,period_aggregate17 NUMBER
	,period_aggregate18 NUMBER
	,period_aggregate19 NUMBER
	,period_aggregate20 NUMBER
	,period_aggregate21 NUMBER
	,period_aggregate22 NUMBER
	,period_aggregate23 NUMBER
	,period_aggregate24 NUMBER
	,period_aggregate25 NUMBER
	,period_aggregate26 NUMBER
	,period_aggregate27 NUMBER
	,period_aggregate28 NUMBER
	,period_aggregate29 NUMBER
	,period_aggregate30 NUMBER
	,period_aggregate31 NUMBER
	,period_aggregate32 NUMBER
	,period_aggregate33 NUMBER
	,period_aggregate34 NUMBER
	,period_aggregate35 NUMBER
	,end_of_day1 NUMBER
	,end_of_day2 NUMBER
	,end_of_day3 NUMBER
	,end_of_day4 NUMBER
	,end_of_day5 NUMBER
	,end_of_day6 NUMBER
	,end_of_day7 NUMBER
	,end_of_day8 NUMBER
	,end_of_day9 NUMBER
	,end_of_day10 NUMBER
	,end_of_day11 NUMBER
	,end_of_day12 NUMBER
	,end_of_day13 NUMBER
	,end_of_day14 NUMBER
	,end_of_day15 NUMBER
	,end_of_day16 NUMBER
	,end_of_day17 NUMBER
	,end_of_day18 NUMBER
	,end_of_day19 NUMBER
	,end_of_day20 NUMBER
	,end_of_day21 NUMBER
	,end_of_day22 NUMBER
	,end_of_day23 NUMBER
	,end_of_day24 NUMBER
	,end_of_day25 NUMBER
	,end_of_day26 NUMBER
	,end_of_day27 NUMBER
	,end_of_day28 NUMBER
	,end_of_day29 NUMBER
	,end_of_day30 NUMBER
	,end_of_day31 NUMBER
	,end_of_day32 NUMBER
	,end_of_day33 NUMBER
	,end_of_day34 NUMBER
	,end_of_day35 NUMBER
	,quarter_aggregate1 NUMBER
	,quarter_aggregate2 NUMBER
	,quarter_aggregate3 NUMBER
	,quarter_aggregate4 NUMBER
	,quarter_aggregate5 NUMBER
	,quarter_aggregate6 NUMBER
	,quarter_aggregate7 NUMBER
	,quarter_aggregate8 NUMBER
	,quarter_aggregate9 NUMBER
	,quarter_aggregate10 NUMBER
	,quarter_aggregate11 NUMBER
	,quarter_aggregate12 NUMBER
	,quarter_aggregate13 NUMBER
	,quarter_aggregate14 NUMBER
	,quarter_aggregate15 NUMBER
	,quarter_aggregate16 NUMBER
	,quarter_aggregate17 NUMBER
	,quarter_aggregate18 NUMBER
	,quarter_aggregate19 NUMBER
	,quarter_aggregate20 NUMBER
	,quarter_aggregate21 NUMBER
	,quarter_aggregate22 NUMBER
	,quarter_aggregate23 NUMBER
	,quarter_aggregate24 NUMBER
	,quarter_aggregate25 NUMBER
	,quarter_aggregate26 NUMBER
	,quarter_aggregate27 NUMBER
	,quarter_aggregate28 NUMBER
	,quarter_aggregate29 NUMBER
	,quarter_aggregate30 NUMBER
	,quarter_aggregate31 NUMBER
	,quarter_aggregate32 NUMBER
	,quarter_aggregate33 NUMBER
	,quarter_aggregate34 NUMBER
	,quarter_aggregate35 NUMBER
	,year_aggregate1 NUMBER
	,year_aggregate2 NUMBER
	,year_aggregate3 NUMBER
	,year_aggregate4 NUMBER
	,year_aggregate5 NUMBER
	,year_aggregate6 NUMBER
	,year_aggregate7 NUMBER
	,year_aggregate8 NUMBER
	,year_aggregate9 NUMBER
	,year_aggregate10 NUMBER
	,year_aggregate11 NUMBER
	,year_aggregate12 NUMBER
	,year_aggregate13 NUMBER
	,year_aggregate14 NUMBER
	,year_aggregate15 NUMBER
	,year_aggregate16 NUMBER
	,year_aggregate17 NUMBER
	,year_aggregate18 NUMBER
	,year_aggregate19 NUMBER
	,year_aggregate20 NUMBER
	,year_aggregate21 NUMBER
	,year_aggregate22 NUMBER
	,year_aggregate23 NUMBER
	,year_aggregate24 NUMBER
	,year_aggregate25 NUMBER
	,year_aggregate26 NUMBER
	,year_aggregate27 NUMBER
	,year_aggregate28 NUMBER
	,year_aggregate29 NUMBER
	,year_aggregate30 NUMBER
	,year_aggregate31 NUMBER
	,year_aggregate32 NUMBER
	,year_aggregate33 NUMBER
	,year_aggregate34 NUMBER
	,year_aggregate35 NUMBER
	,opening_period_aggregate NUMBER
);

CREATE  INDEX GL_DAILY_BALANCES_N1 ON GL_DAILY_BALANCES (CODE_COMBINATION_ID, PERIOD_NAME, CURRENCY_CODE);
CREATE  INDEX GL_DAILY_BALANCES_N2 ON GL_DAILY_BALANCES (PERIOD_NAME);
CREATE  INDEX GL_DAILY_BALANCES_N3 ON GL_DAILY_BALANCES (PERIOD_YEAR, PERIOD_NUM);
CREATE  INDEX GL_DAILY_BALANCES_N4 ON GL_DAILY_BALANCES (TEMPLATE_ID);
