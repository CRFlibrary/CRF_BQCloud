CREATE OR REPLACE VIEW GL_ALLOC_BATCHES# AS
select ALLOCATION_BATCH_ID ALLOCATION_BATCH_ID, NAME NAME, CHART_OF_ACCOUNTS_ID CHART_OF_ACCOUNTS_ID, VALIDATION_STATUS VALIDATION_STATUS, ACTUAL_FLAG ACTUAL_FLAG, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, VALIDATION_REQUEST_ID VALIDATION_REQUEST_ID, DESCRIPTION DESCRIPTION, SECURITY_FLAG SECURITY_FLAG from "GL"."GL_ALLOC_BATCHES";


