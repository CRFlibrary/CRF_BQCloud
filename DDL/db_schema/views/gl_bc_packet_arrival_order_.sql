CREATE OR REPLACE VIEW GL_BC_PACKET_ARRIVAL_ORDER# AS
select PACKET_ID PACKET_ID, LEDGER_ID LEDGER_ID, ARRIVAL_SEQ ARRIVAL_SEQ, AFFECT_FUNDS_FLAG AFFECT_FUNDS_FLAG, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY from "GL"."GL_BC_PACKET_ARRIVAL_ORDER";


