CREATE OR REPLACE VIEW GL_MC_UPGRADE_HISTORY# AS
select PRIMARY_SET_OF_BOOKS_ID PRIMARY_SET_OF_BOOKS_ID, REPORTING_SET_OF_BOOKS_ID REPORTING_SET_OF_BOOKS_ID, APPLICATION_ID APPLICATION_ID, TABLE_NAME TABLE_NAME, PERIOD_NAME PERIOD_NAME, CONVERSION_STATUS CONVERSION_STATUS, ROUNDING_STATUS ROUNDING_STATUS, UPGRADE_RUN_ID UPGRADE_RUN_ID, LAST_PROCESSED_ID1 LAST_PROCESSED_ID1, LAST_PROCESSED_ID2 LAST_PROCESSED_ID2, LAST_UPDATE_DATE LAST_UPDATE_DATE, REQUEST_ID REQUEST_ID, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_MC_UPGRADE_HISTORY";


