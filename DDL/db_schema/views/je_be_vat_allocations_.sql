CREATE OR REPLACE VIEW JE_BE_VAT_ALLOCATIONS# AS
select ALLOCATION_ID ALLOCATION_ID, SOURCE SOURCE, SET_OF_BOOKS_ID SET_OF_BOOKS_ID, TRANS_ID TRANS_ID, TRANS_LINE_ID TRANS_LINE_ID, OF_TRANS_TYPE OF_TRANS_TYPE, VAT_TRANS_TYPE VAT_TRANS_TYPE, LINE_TYPE LINE_TYPE, TAX_NAME TAX_NAME, AMOUNT AMOUNT, TRANS_DATE TRANS_DATE, VAT_REPORT_BOX VAT_REPORT_BOX, DECLARATION_ID DECLARATION_ID from "GL"."JE_BE_VAT_ALLOCATIONS";


