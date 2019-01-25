CREATE OR REPLACE VIEW GL_CONSOLIDATION# AS
select CONSOLIDATION_ID CONSOLIDATION_ID, NAME NAME, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, FROM_LEDGER_ID FROM_LEDGER_ID, TO_LEDGER_ID TO_LEDGER_ID, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, DESCRIPTION DESCRIPTION, METHOD METHOD, FROM_CURRENCY_CODE FROM_CURRENCY_CODE, FROM_LOCATION FROM_LOCATION, FROM_ORACLE_ID FROM_ORACLE_ID, START_DATE_ACTIVE_11I START_DATE_ACTIVE_11I, END_DATE_ACTIVE_11I END_DATE_ACTIVE_11I, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, CONTEXT CONTEXT, USAGE_CODE USAGE_CODE, RUN_JOURNAL_IMPORT_FLAG RUN_JOURNAL_IMPORT_FLAG, SUMMARIZE_LINES_FLAG SUMMARIZE_LINES_FLAG, AUDIT_MODE_FLAG AUDIT_MODE_FLAG, RUN_POSTING_FLAG RUN_POSTING_FLAG, COA_MAPPING_ID COA_MAPPING_ID, SECURITY_FLAG SECURITY_FLAG from "GL"."GL_CONSOLIDATION";

