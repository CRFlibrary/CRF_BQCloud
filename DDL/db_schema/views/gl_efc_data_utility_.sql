CREATE OR REPLACE VIEW GL_EFC_DATA_UTILITY# AS
select PSOB PSOB, RSOB RSOB, CORRECT_FLAG CORRECT_FLAG, PHASE PHASE, AP_FLAG AP_FLAG, AR_FLAG AR_FLAG, PO_FLAG PO_FLAG from "GL"."GL_EFC_DATA_UTILITY";


