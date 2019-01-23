CREATE OR REPLACE VIEW JE_BE_LOGS# AS
select DECLARATION_ID DECLARATION_ID, DECLARATION_TYPE_CODE DECLARATION_TYPE_CODE, SET_OF_BOOKS_ID SET_OF_BOOKS_ID, START_DATE START_DATE, END_DATE END_DATE, PERIOD_NAME PERIOD_NAME, DECLARATION_STATUS_CODE DECLARATION_STATUS_CODE, REGIME_CODE REGIME_CODE, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE from "GL"."JE_BE_LOGS";


