CREATE OR REPLACE VIEW GL_INTERCOMPANY_ACC_SETS# AS
select LEDGER_ID LEDGER_ID, JE_SOURCE_NAME JE_SOURCE_NAME, JE_CATEGORY_NAME JE_CATEGORY_NAME, BALANCE_BY_CODE BALANCE_BY_CODE, BAL_SEG_RULE_CODE BAL_SEG_RULE_CODE, ALWAYS_BALANCE_FLAG ALWAYS_BALANCE_FLAG, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, DEFAULT_BAL_SEG_VALUE DEFAULT_BAL_SEG_VALUE, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15 from "GL"."GL_INTERCOMPANY_ACC_SETS";

