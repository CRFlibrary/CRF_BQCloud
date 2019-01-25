CREATE OR REPLACE VIEW GL_SHARES_ACTIVITY# AS
select LEDGER_ID LEDGER_ID, ACTIVITY_DATE ACTIVITY_DATE, ACTIVITY_TYPE_CODE ACTIVITY_TYPE_CODE, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, SPLIT_RATIO_FROM SPLIT_RATIO_FROM, SPLIT_RATIO_TO SPLIT_RATIO_TO, DIVIDEND_PERCENT DIVIDEND_PERCENT, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15 from "GL"."GL_SHARES_ACTIVITY";

