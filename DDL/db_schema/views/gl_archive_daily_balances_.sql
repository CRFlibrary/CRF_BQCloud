CREATE OR REPLACE VIEW GL_ARCHIVE_DAILY_BALANCES# AS
select LEDGER_ID LEDGER_ID, CODE_COMBINATION_ID CODE_COMBINATION_ID, CURRENCY_CODE CURRENCY_CODE, CURRENCY_TYPE CURRENCY_TYPE, ACTUAL_FLAG ACTUAL_FLAG, PERIOD_NAME PERIOD_NAME, PERIOD_START_DATE PERIOD_START_DATE, PERIOD_END_DATE PERIOD_END_DATE, QUARTER_START_DATE QUARTER_START_DATE, YEAR_START_DATE YEAR_START_DATE, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CONVERTED_FROM_CURRENCY CONVERTED_FROM_CURRENCY, PERIOD_TYPE PERIOD_TYPE, PERIOD_YEAR PERIOD_YEAR, PERIOD_NUM PERIOD_NUM, TEMPLATE_ID TEMPLATE_ID, OPENING_PERIOD_AGGREGATE OPENING_PERIOD_AGGREGATE, OPENING_QUARTER_AGGREGATE OPENING_QUARTER_AGGREGATE, OPENING_YEAR_AGGREGATE OPENING_YEAR_AGGREGATE, PERIOD_AGGREGATE1 PERIOD_AGGREGATE1, PERIOD_AGGREGATE2 PERIOD_AGGREGATE2, PERIOD_AGGREGATE3 PERIOD_AGGREGATE3, PERIOD_AGGREGATE4 PERIOD_AGGREGATE4, PERIOD_AGGREGATE5 PERIOD_AGGREGATE5, PERIOD_AGGREGATE6 PERIOD_AGGREGATE6, PERIOD_AGGREGATE7 PERIOD_AGGREGATE7, PERIOD_AGGREGATE8 PERIOD_AGGREGATE8, PERIOD_AGGREGATE9 PERIOD_AGGREGATE9, PERIOD_AGGREGATE10 PERIOD_AGGREGATE10, PERIOD_AGGREGATE11 PERIOD_AGGREGATE11, PERIOD_AGGREGATE12 PERIOD_AGGREGATE12, PERIOD_AGGREGATE13 PERIOD_AGGREGATE13, PERIOD_AGGREGATE14 PERIOD_AGGREGATE14, PERIOD_AGGREGATE15 PERIOD_AGGREGATE15, PERIOD_AGGREGATE16 PERIOD_AGGREGATE16, PERIOD_AGGREGATE17 PERIOD_AGGREGATE17, PERIOD_AGGREGATE18 PERIOD_AGGREGATE18, PERIOD_AGGREGATE19 PERIOD_AGGREGATE19, PERIOD_AGGREGATE20 PERIOD_AGGREGATE20, PERIOD_AGGREGATE21 PERIOD_AGGREGATE21, PERIOD_AGGREGATE22 PERIOD_AGGREGATE22, PERIOD_AGGREGATE23 PERIOD_AGGREGATE23, PERIOD_AGGREGATE24 PERIOD_AGGREGATE24, PERIOD_AGGREGATE25 PERIOD_AGGREGATE25, PERIOD_AGGREGATE26 PERIOD_AGGREGATE26, PERIOD_AGGREGATE27 PERIOD_AGGREGATE27, PERIOD_AGGREGATE28 PERIOD_AGGREGATE28, PERIOD_AGGREGATE29 PERIOD_AGGREGATE29, PERIOD_AGGREGATE30 PERIOD_AGGREGATE30, PERIOD_AGGREGATE31 PERIOD_AGGREGATE31, PERIOD_AGGREGATE32 PERIOD_AGGREGATE32, PERIOD_AGGREGATE33 PERIOD_AGGREGATE33, PERIOD_AGGREGATE34 PERIOD_AGGREGATE34, PERIOD_AGGREGATE35 PERIOD_AGGREGATE35, END_OF_DAY1 END_OF_DAY1, END_OF_DAY2 END_OF_DAY2, END_OF_DAY3 END_OF_DAY3, END_OF_DAY4 END_OF_DAY4, END_OF_DAY5 END_OF_DAY5, END_OF_DAY6 END_OF_DAY6, END_OF_DAY7 END_OF_DAY7, END_OF_DAY8 END_OF_DAY8, END_OF_DAY9 END_OF_DAY9, END_OF_DAY10 END_OF_DAY10, END_OF_DAY11 END_OF_DAY11, END_OF_DAY12 END_OF_DAY12, END_OF_DAY13 END_OF_DAY13, END_OF_DAY14 END_OF_DAY14, END_OF_DAY15 END_OF_DAY15, END_OF_DAY16 END_OF_DAY16, END_OF_DAY17 END_OF_DAY17, END_OF_DAY18 END_OF_DAY18, END_OF_DAY19 END_OF_DAY19, END_OF_DAY20 END_OF_DAY20, END_OF_DAY21 END_OF_DAY21, END_OF_DAY22 END_OF_DAY22, END_OF_DAY23 END_OF_DAY23, END_OF_DAY24 END_OF_DAY24, END_OF_DAY25 END_OF_DAY25, END_OF_DAY26 END_OF_DAY26, END_OF_DAY27 END_OF_DAY27, END_OF_DAY28 END_OF_DAY28, END_OF_DAY29 END_OF_DAY29, END_OF_DAY30 END_OF_DAY30, END_OF_DAY31 END_OF_DAY31, END_OF_DAY32 END_OF_DAY32, END_OF_DAY33 END_OF_DAY33, END_OF_DAY34 END_OF_DAY34, END_OF_DAY35 END_OF_DAY35, QUARTER_AGGREGATE1 QUARTER_AGGREGATE1, QUARTER_AGGREGATE2 QUARTER_AGGREGATE2, QUARTER_AGGREGATE3 QUARTER_AGGREGATE3, QUARTER_AGGREGATE4 QUARTER_AGGREGATE4, QUARTER_AGGREGATE5 QUARTER_AGGREGATE5, QUARTER_AGGREGATE6 QUARTER_AGGREGATE6, QUARTER_AGGREGATE7 QUARTER_AGGREGATE7, QUARTER_AGGREGATE8 QUARTER_AGGREGATE8, QUARTER_AGGREGATE9 QUARTER_AGGREGATE9, QUARTER_AGGREGATE10 QUARTER_AGGREGATE10, QUARTER_AGGREGATE11 QUARTER_AGGREGATE11, QUARTER_AGGREGATE12 QUARTER_AGGREGATE12, QUARTER_AGGREGATE13 QUARTER_AGGREGATE13, QUARTER_AGGREGATE14 QUARTER_AGGREGATE14, QUARTER_AGGREGATE15 QUARTER_AGGREGATE15, QUARTER_AGGREGATE16 QUARTER_AGGREGATE16, QUARTER_AGGREGATE17 QUARTER_AGGREGATE17, QUARTER_AGGREGATE18 QUARTER_AGGREGATE18, QUARTER_AGGREGATE19 QUARTER_AGGREGATE19, QUARTER_AGGREGATE20 QUARTER_AGGREGATE20, QUARTER_AGGREGATE21 QUARTER_AGGREGATE21, QUARTER_AGGREGATE22 QUARTER_AGGREGATE22, QUARTER_AGGREGATE23 QUARTER_AGGREGATE23, QUARTER_AGGREGATE24 QUARTER_AGGREGATE24, QUARTER_AGGREGATE25 QUARTER_AGGREGATE25, QUARTER_AGGREGATE26 QUARTER_AGGREGATE26, QUARTER_AGGREGATE27 QUARTER_AGGREGATE27, QUARTER_AGGREGATE28 QUARTER_AGGREGATE28, QUARTER_AGGREGATE29 QUARTER_AGGREGATE29, QUARTER_AGGREGATE30 QUARTER_AGGREGATE30, QUARTER_AGGREGATE31 QUARTER_AGGREGATE31, QUARTER_AGGREGATE32 QUARTER_AGGREGATE32, QUARTER_AGGREGATE33 QUARTER_AGGREGATE33, QUARTER_AGGREGATE34 QUARTER_AGGREGATE34, QUARTER_AGGREGATE35 QUARTER_AGGREGATE35, YEAR_AGGREGATE1 YEAR_AGGREGATE1, YEAR_AGGREGATE2 YEAR_AGGREGATE2, YEAR_AGGREGATE3 YEAR_AGGREGATE3, YEAR_AGGREGATE4 YEAR_AGGREGATE4, YEAR_AGGREGATE5 YEAR_AGGREGATE5, YEAR_AGGREGATE6 YEAR_AGGREGATE6, YEAR_AGGREGATE7 YEAR_AGGREGATE7, YEAR_AGGREGATE8 YEAR_AGGREGATE8, YEAR_AGGREGATE9 YEAR_AGGREGATE9, YEAR_AGGREGATE10 YEAR_AGGREGATE10, YEAR_AGGREGATE11 YEAR_AGGREGATE11, YEAR_AGGREGATE12 YEAR_AGGREGATE12, YEAR_AGGREGATE13 YEAR_AGGREGATE13, YEAR_AGGREGATE14 YEAR_AGGREGATE14, YEAR_AGGREGATE15 YEAR_AGGREGATE15, YEAR_AGGREGATE16 YEAR_AGGREGATE16, YEAR_AGGREGATE17 YEAR_AGGREGATE17, YEAR_AGGREGATE18 YEAR_AGGREGATE18, YEAR_AGGREGATE19 YEAR_AGGREGATE19, YEAR_AGGREGATE20 YEAR_AGGREGATE20, YEAR_AGGREGATE21 YEAR_AGGREGATE21, YEAR_AGGREGATE22 YEAR_AGGREGATE22, YEAR_AGGREGATE23 YEAR_AGGREGATE23, YEAR_AGGREGATE24 YEAR_AGGREGATE24, YEAR_AGGREGATE25 YEAR_AGGREGATE25, YEAR_AGGREGATE26 YEAR_AGGREGATE26, YEAR_AGGREGATE27 YEAR_AGGREGATE27, YEAR_AGGREGATE28 YEAR_AGGREGATE28, YEAR_AGGREGATE29 YEAR_AGGREGATE29, YEAR_AGGREGATE30 YEAR_AGGREGATE30, YEAR_AGGREGATE31 YEAR_AGGREGATE31, YEAR_AGGREGATE32 YEAR_AGGREGATE32, YEAR_AGGREGATE33 YEAR_AGGREGATE33, YEAR_AGGREGATE34 YEAR_AGGREGATE34, YEAR_AGGREGATE35 YEAR_AGGREGATE35 from "GL"."GL_ARCHIVE_DAILY_BALANCES";

