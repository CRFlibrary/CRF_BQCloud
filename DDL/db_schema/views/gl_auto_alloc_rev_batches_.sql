CREATE OR REPLACE VIEW GL_AUTO_ALLOC_REV_BATCHES# AS
select REVERSAL_JE_HEADER_ID REVERSAL_JE_HEADER_ID, REVERSAL_JE_BATCH_ID REVERSAL_JE_BATCH_ID, REQUEST_ID REQUEST_ID, PARENT_REQUEST_ID PARENT_REQUEST_ID, JE_BATCH_ID JE_BATCH_ID, JE_HEADER_ID JE_HEADER_ID, BATCH_TYPE_CODE BATCH_TYPE_CODE, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY from "GL"."GL_AUTO_ALLOC_REV_BATCHES";


