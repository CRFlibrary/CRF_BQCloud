CREATE OR REPLACE VIEW GL_UPGRADE_STATUS# AS
select MAX_BATCH_ID MAX_BATCH_ID, MAX_HEADER_ID MAX_HEADER_ID from "GL"."GL_UPGRADE_STATUS";


