CREATE OR REPLACE VIEW GL_ACCOUNT_HIERARCHIES# AS
select LEDGER_ID LEDGER_ID, SUMMARY_CODE_COMBINATION_ID SUMMARY_CODE_COMBINATION_ID, DETAIL_CODE_COMBINATION_ID DETAIL_CODE_COMBINATION_ID, TEMPLATE_ID TEMPLATE_ID, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, ORDERING_VALUE ORDERING_VALUE from "GL"."GL_ACCOUNT_HIERARCHIES";


