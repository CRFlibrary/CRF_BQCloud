CREATE OR REPLACE VIEW GL_DAILY_CONVERSION_TYPES# AS
select CONVERSION_TYPE CONVERSION_TYPE, USER_CONVERSION_TYPE USER_CONVERSION_TYPE, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, DESCRIPTION DESCRIPTION, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15, CONTEXT CONTEXT, FEM_ENABLED_FLAG FEM_ENABLED_FLAG, FEM_SCENARIO FEM_SCENARIO, FEM_RATE_TYPE_CODE FEM_RATE_TYPE_CODE, FEM_TIMEFRAME FEM_TIMEFRAME, SECURITY_FLAG SECURITY_FLAG, ZD_EDITION_NAME ZD_EDITION_NAME from "GL"."GL_DAILY_CONVERSION_TYPES";

