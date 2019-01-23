CREATE OR REPLACE VIEW GL_PERIOD_TYPES# AS
select PERIOD_TYPE PERIOD_TYPE, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, NUMBER_PER_FISCAL_YEAR NUMBER_PER_FISCAL_YEAR, YEAR_TYPE_IN_NAME YEAR_TYPE_IN_NAME, USER_PERIOD_TYPE USER_PERIOD_TYPE, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, DESCRIPTION DESCRIPTION, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, CONTEXT CONTEXT, PERIOD_TYPE_ID PERIOD_TYPE_ID, ZD_EDITION_NAME ZD_EDITION_NAME from "GL"."GL_PERIOD_TYPES";


