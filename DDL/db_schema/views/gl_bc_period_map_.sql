CREATE OR REPLACE VIEW GL_BC_PERIOD_MAP# AS
select LEDGER_ID LEDGER_ID, BOUNDARY_CODE BOUNDARY_CODE, TRANSACTION_PERIOD_NAME TRANSACTION_PERIOD_NAME, ACTUAL_FLAG ACTUAL_FLAG, BUDGET_VERSION_ID BUDGET_VERSION_ID, QUERY_PERIOD_NAME QUERY_PERIOD_NAME, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, REQUEST_ID REQUEST_ID, PROGRAM_APPLICATION_ID PROGRAM_APPLICATION_ID, PROGRAM_ID PROGRAM_ID, PROGRAM_UPDATE_DATE PROGRAM_UPDATE_DATE from "GL"."GL_BC_PERIOD_MAP";

