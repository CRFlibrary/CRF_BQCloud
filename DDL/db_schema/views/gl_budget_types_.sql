CREATE OR REPLACE VIEW GL_BUDGET_TYPES# AS
select BUDGET_TYPE BUDGET_TYPE, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, AUDIT_TRAIL_FLAG AUDIT_TRAIL_FLAG, DESCRIPTION DESCRIPTION, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, CONTEXT CONTEXT from "GL"."GL_BUDGET_TYPES";


