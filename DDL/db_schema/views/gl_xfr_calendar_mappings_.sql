CREATE OR REPLACE VIEW GL_XFR_CALENDAR_MAPPINGS# AS
select CALENDAR_MAPPING_ID CALENDAR_MAPPING_ID, NAME NAME, FROM_PERIOD_SET_NAME FROM_PERIOD_SET_NAME, FROM_PERIOD_TYPE FROM_PERIOD_TYPE, TO_PERIOD_SET_NAME TO_PERIOD_SET_NAME, TO_PERIOD_TYPE TO_PERIOD_TYPE, DESCRIPTION DESCRIPTION, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_XFR_CALENDAR_MAPPINGS";


