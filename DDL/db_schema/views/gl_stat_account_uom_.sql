CREATE OR REPLACE VIEW GL_STAT_ACCOUNT_UOM# AS
select ACCOUNT_SEGMENT_VALUE ACCOUNT_SEGMENT_VALUE, UNIT_OF_MEASURE UNIT_OF_MEASURE, CHART_OF_ACCOUNTS_ID CHART_OF_ACCOUNTS_ID, DESCRIPTION DESCRIPTION, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_STAT_ACCOUNT_UOM";


