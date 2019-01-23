CREATE OR REPLACE VIEW GL_XFR_PERIODS# AS
select PERIOD_NAME PERIOD_NAME, PERIOD_SET_NAME PERIOD_SET_NAME, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, START_DATE START_DATE, END_DATE END_DATE, YEAR_START_DATE YEAR_START_DATE, QUARTER_START_DATE QUARTER_START_DATE, PERIOD_TYPE PERIOD_TYPE, PERIOD_YEAR PERIOD_YEAR, PERIOD_NUM PERIOD_NUM, QUARTER_NUM QUARTER_NUM, ENTERED_PERIOD_NAME ENTERED_PERIOD_NAME, ADJUSTMENT_PERIOD_FLAG ADJUSTMENT_PERIOD_FLAG, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, DESCRIPTION DESCRIPTION, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE_CATEGORY ATTRIBUTE_CATEGORY, OBJECT_VERSION_NUMBER OBJECT_VERSION_NUMBER, CONFIRMATION_STATUS CONFIRMATION_STATUS from "GL"."GL_XFR_PERIODS";


