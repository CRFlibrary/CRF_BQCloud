CREATE OR REPLACE VIEW GL_SUSPENSE_ACCOUNTS# AS
select LEDGER_ID LEDGER_ID, JE_SOURCE_NAME JE_SOURCE_NAME, JE_CATEGORY_NAME JE_CATEGORY_NAME, CODE_COMBINATION_ID CODE_COMBINATION_ID, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, CONTEXT CONTEXT from "GL"."GL_SUSPENSE_ACCOUNTS";


