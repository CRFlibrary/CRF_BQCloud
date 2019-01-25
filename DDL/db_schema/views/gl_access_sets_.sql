CREATE OR REPLACE VIEW GL_ACCESS_SETS# AS
select ACCESS_SET_ID ACCESS_SET_ID, NAME NAME, SECURITY_SEGMENT_CODE SECURITY_SEGMENT_CODE, ENABLED_FLAG ENABLED_FLAG, CHART_OF_ACCOUNTS_ID CHART_OF_ACCOUNTS_ID, PERIOD_SET_NAME PERIOD_SET_NAME, ACCOUNTED_PERIOD_TYPE ACCOUNTED_PERIOD_TYPE, AUTOMATICALLY_CREATED_FLAG AUTOMATICALLY_CREATED_FLAG, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE, SECURED_SEG_VALUE_SET_ID SECURED_SEG_VALUE_SET_ID, DEFAULT_LEDGER_ID DEFAULT_LEDGER_ID, DESCRIPTION DESCRIPTION, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15 from "GL"."GL_ACCESS_SETS";

