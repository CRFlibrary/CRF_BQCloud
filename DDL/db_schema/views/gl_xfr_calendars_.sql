CREATE OR REPLACE VIEW GL_XFR_CALENDARS# AS
select CALENDAR_ID CALENDAR_ID, USER_PERIOD_SET_NAME USER_PERIOD_SET_NAME, PERIOD_SET_NAME PERIOD_SET_NAME, PERIOD_SET_ID PERIOD_SET_ID, PERIOD_TYPE PERIOD_TYPE, PERIOD_TYPE_ID PERIOD_TYPE_ID, DESCRIPTION DESCRIPTION, SECURITY_FLAG SECURITY_FLAG, NON_ADJ_PERIOD_FREQ_CODE NON_ADJ_PERIOD_FREQ_CODE, ADJ_PERIOD_FREQ_CODE ADJ_PERIOD_FREQ_CODE, ADJ_PERIODS_NUM ADJ_PERIODS_NUM, LEGACY_RULES_ENABLED_FLAG LEGACY_RULES_ENABLED_FLAG, NON_ADJ_PERIODS_NUM NON_ADJ_PERIODS_NUM, USER_PERIOD_NAME_PREFIX USER_PERIOD_NAME_PREFIX, PERIOD_NAME_FORMAT_CODE PERIOD_NAME_FORMAT_CODE, PERIOD_NAME_SEPARATOR_CODE PERIOD_NAME_SEPARATOR_CODE, LATEST_YEAR_START_DATE LATEST_YEAR_START_DATE, CALENDAR_START_DATE CALENDAR_START_DATE, CALENDAR_TYPE_CODE CALENDAR_TYPE_CODE, LEGACY_CALENDAR_FLAG LEGACY_CALENDAR_FLAG, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE_CATEGORY ATTRIBUTE_CATEGORY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, LAST_UPDATED_BY LAST_UPDATED_BY, OBJECT_VERSION_NUMBER OBJECT_VERSION_NUMBER from "GL"."GL_XFR_CALENDARS";


