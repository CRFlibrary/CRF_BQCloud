CREATE OR REPLACE VIEW GL_AUTO_ALLOC_BAT_HIST_DET# AS
select REQUEST_ID REQUEST_ID, PROGRAM_NAME_CODE PROGRAM_NAME_CODE, PARENT_REQUEST_ID PARENT_REQUEST_ID, STEP_NUMBER STEP_NUMBER, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, RUN_MODE RUN_MODE, STATUS_CODE STATUS_CODE from "GL"."GL_AUTO_ALLOC_BAT_HIST_DET";


