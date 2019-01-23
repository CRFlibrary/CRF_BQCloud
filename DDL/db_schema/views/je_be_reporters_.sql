CREATE OR REPLACE VIEW JE_BE_REPORTERS# AS
select REPORTER_ID REPORTER_ID, NAME NAME, ADDRESS ADDRESS, POSTAL_CODE POSTAL_CODE, CITY CITY, COUNTRY_CODE COUNTRY_CODE, CONTACT CONTACT, TELEPHONE TELEPHONE, VAT_NUMBER VAT_NUMBER, ESTABLISHMENT_NUMBER ESTABLISHMENT_NUMBER, PROCESSING_UNIT_NUMBER PROCESSING_UNIT_NUMBER, SET_OF_BOOKS_ID SET_OF_BOOKS_ID, REGIME REGIME, AP_REPORT_TO_INTRASTAT_FLAG AP_REPORT_TO_INTRASTAT_FLAG, AR_REPORT_TO_INTRASTAT_FLAG AR_REPORT_TO_INTRASTAT_FLAG, AP_DEFAULT_INTRASTAT_INFO AP_DEFAULT_INTRASTAT_INFO, AR_DEFAULT_INTRASTAT_INFO AR_DEFAULT_INTRASTAT_INFO, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE from "GL"."JE_BE_REPORTERS";


