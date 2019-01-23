CREATE OR REPLACE VIEW GL_SUMMARY_HIERARCHIES# AS
select TEMPLATE_ID TEMPLATE_ID, SEGMENT_POS SEGMENT_POS, FLEX_VALUE_SET_ID FLEX_VALUE_SET_ID, PARENT_FLEX_VALUE PARENT_FLEX_VALUE, CHILD_FLEX_VALUE_LOW CHILD_FLEX_VALUE_LOW, CHILD_FLEX_VALUE_HIGH CHILD_FLEX_VALUE_HIGH, STATUS_CODE STATUS_CODE, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_SUMMARY_HIERARCHIES";


