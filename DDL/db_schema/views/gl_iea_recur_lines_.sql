CREATE OR REPLACE VIEW GL_IEA_RECUR_LINES# AS
select RECURRING_TRANSACTION_ID RECURRING_TRANSACTION_ID, SENDER_RECEIVER_CODE SENDER_RECEIVER_CODE, LINE_NUMBER LINE_NUMBER, OFFSET_CCID OFFSET_CCID, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, ENTERED_CR ENTERED_CR, ENTERED_DR ENTERED_DR, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15 from "GL"."GL_IEA_RECUR_LINES";

