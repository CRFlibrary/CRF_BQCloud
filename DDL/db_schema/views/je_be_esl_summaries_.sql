CREATE OR REPLACE VIEW JE_BE_ESL_SUMMARIES# AS
select ESL_SUMMARY_ID ESL_SUMMARY_ID, DECLARATION_ID DECLARATION_ID, LINE_NUMBER LINE_NUMBER, CUSTOMER_NAME CUSTOMER_NAME, SET_OF_BOOKS_ID SET_OF_BOOKS_ID, ESL_PERIOD_NAME ESL_PERIOD_NAME, SITE_USE_ID SITE_USE_ID, ESL_CODE ESL_CODE, AMOUNT AMOUNT, CORRECTION_PERIOD_NAME CORRECTION_PERIOD_NAME from "GL"."JE_BE_ESL_SUMMARIES";


