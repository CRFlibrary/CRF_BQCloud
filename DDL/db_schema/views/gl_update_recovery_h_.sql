CREATE OR REPLACE VIEW GL_UPDATE_RECOVERY_H# AS
select OBJECT_NAME OBJECT_NAME, COLUMN_NAME COLUMN_NAME, PREUPDATE_COLUMN_VALUE PREUPDATE_COLUMN_VALUE, PRIMARY_KEY_VALUE PRIMARY_KEY_VALUE, UPDATE_SCRIPT_NAME UPDATE_SCRIPT_NAME, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN from "GL"."GL_UPDATE_RECOVERY_H";

