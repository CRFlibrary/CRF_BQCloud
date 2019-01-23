CREATE OR REPLACE VIEW GL_IEA_RECUR_TRANSACTIONS# AS
select RECURRING_TRANSACTION_ID RECURRING_TRANSACTION_ID, RECURRING_BATCH_ID RECURRING_BATCH_ID, TRANSACTION_TYPE_ID TRANSACTION_TYPE_ID, CURRENCY_CODE CURRENCY_CODE, NAME NAME, RECEIVING_SUBSIDIARY_ID RECEIVING_SUBSIDIARY_ID, RECEIVER_COA_ID RECEIVER_COA_ID, STATUS STATUS, SENDER_CLEARING_CCID SENDER_CLEARING_CCID, RECEIVER_CLEARING_CCID RECEIVER_CLEARING_CCID, SENDER_CLEARING_ACCOUNT SENDER_CLEARING_ACCOUNT, RECEIVER_CLEARING_ACCOUNT RECEIVER_CLEARING_ACCOUNT, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, SENDER_RUNNING_TOTAL_CR SENDER_RUNNING_TOTAL_CR, RECEIVER_RUNNING_TOTAL_DR RECEIVER_RUNNING_TOTAL_DR, RECEIVER_RUNNING_TOTAL_CR RECEIVER_RUNNING_TOTAL_CR, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, SENDER_RUNNING_TOTAL_DR SENDER_RUNNING_TOTAL_DR, CONTROL_TOTAL CONTROL_TOTAL, DESCRIPTION DESCRIPTION, NOTE NOTE, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15 from "GL"."GL_IEA_RECUR_TRANSACTIONS";


