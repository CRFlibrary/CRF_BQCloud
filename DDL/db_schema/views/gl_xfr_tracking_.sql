CREATE OR REPLACE VIEW GL_XFR_TRACKING# AS
select XFER_REQUEST_ID XFER_REQUEST_ID, JE_SOURCE_KEY JE_SOURCE_KEY, GROUP_ID GROUP_ID, SYSTEM_ID SYSTEM_ID, INTERFACE_TABLE_NAME INTERFACE_TABLE_NAME, LEDGER_ID LEDGER_ID, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, STATUS_CODE STATUS_CODE, ORIGINAL_FIRST_PERIOD ORIGINAL_FIRST_PERIOD from "GL"."GL_XFR_TRACKING";

