CREATE OR REPLACE VIEW GL_ISPEED_COA_SEGMENTS# AS
select COA_TEMPLATE_ID COA_TEMPLATE_ID, VALUE_SET_NAME VALUE_SET_NAME, SEGMENT_NUMBER SEGMENT_NUMBER, SEGMENT_NAME SEGMENT_NAME, LENGTH LENGTH, USAGE USAGE, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_ISPEED_COA_SEGMENTS";


