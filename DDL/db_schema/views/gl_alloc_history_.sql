CREATE OR REPLACE VIEW GL_ALLOC_HISTORY# AS
select ALLOCATION_BATCH_ID ALLOCATION_BATCH_ID, NAME NAME, SET_OF_BOOKS_ID_11I SET_OF_BOOKS_ID_11I, REQUEST_ID REQUEST_ID, RUN_STATUS RUN_STATUS, FROM_PERIOD_NAME FROM_PERIOD_NAME, TO_PERIOD_NAME TO_PERIOD_NAME, TO_PERIOD_NUM TO_PERIOD_NUM, TO_PERIOD_YEAR TO_PERIOD_YEAR, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_DATE LAST_UPDATE_DATE, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, JOURNAL_EFFECTIVE_DATE JOURNAL_EFFECTIVE_DATE, CALCULATION_EFFECTIVE_DATE CALCULATION_EFFECTIVE_DATE, ACCESS_SET_ID ACCESS_SET_ID from "GL"."GL_ALLOC_HISTORY";


