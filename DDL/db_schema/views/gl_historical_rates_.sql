CREATE OR REPLACE VIEW GL_HISTORICAL_RATES# AS
select LEDGER_ID LEDGER_ID, PERIOD_NAME PERIOD_NAME, PERIOD_NUM PERIOD_NUM, PERIOD_YEAR PERIOD_YEAR, CODE_COMBINATION_ID CODE_COMBINATION_ID, TARGET_CURRENCY TARGET_CURRENCY, UPDATE_FLAG UPDATE_FLAG, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, RATE_TYPE RATE_TYPE, TRANSLATED_RATE TRANSLATED_RATE, TRANSLATED_AMOUNT TRANSLATED_AMOUNT, ACCOUNT_TYPE ACCOUNT_TYPE, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, CONTEXT CONTEXT, USAGE_CODE USAGE_CODE from "GL"."GL_HISTORICAL_RATES";


