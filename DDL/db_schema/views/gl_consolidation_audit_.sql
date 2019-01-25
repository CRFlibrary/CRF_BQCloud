CREATE OR REPLACE VIEW GL_CONSOLIDATION_AUDIT# AS
select CONSOLIDATION_ID CONSOLIDATION_ID, TO_PERIOD_NAME TO_PERIOD_NAME, FROM_PERIOD_NAME FROM_PERIOD_NAME, TO_LEDGER_ID TO_LEDGER_ID, REQUEST_ID REQUEST_ID, ACTUAL_FLAG ACTUAL_FLAG, CONSOLIDATION_TYPE CONSOLIDATION_TYPE, ACCOUNTING_DATE ACCOUNTING_DATE, FROM_LEDGER_ID FROM_LEDGER_ID, FROM_CODE_COMBINATION_ID FROM_CODE_COMBINATION_ID, ENTERED_DR ENTERED_DR, ENTERED_CR ENTERED_CR, SEGMENT1 SEGMENT1, SEGMENT2 SEGMENT2, SEGMENT3 SEGMENT3, SEGMENT4 SEGMENT4, SEGMENT5 SEGMENT5, SEGMENT6 SEGMENT6, SEGMENT7 SEGMENT7, SEGMENT8 SEGMENT8, SEGMENT9 SEGMENT9, SEGMENT10 SEGMENT10, SEGMENT11 SEGMENT11, SEGMENT12 SEGMENT12, SEGMENT13 SEGMENT13, SEGMENT14 SEGMENT14, SEGMENT15 SEGMENT15, SEGMENT16 SEGMENT16, SEGMENT17 SEGMENT17, SEGMENT18 SEGMENT18, SEGMENT19 SEGMENT19, SEGMENT20 SEGMENT20, SEGMENT21 SEGMENT21, SEGMENT22 SEGMENT22, SEGMENT23 SEGMENT23, SEGMENT24 SEGMENT24, SEGMENT25 SEGMENT25, SEGMENT26 SEGMENT26, SEGMENT27 SEGMENT27, SEGMENT28 SEGMENT28, SEGMENT29 SEGMENT29, SEGMENT30 SEGMENT30, AVERAGE_CONSOLIDATION_FLAG AVERAGE_CONSOLIDATION_FLAG from "GL"."GL_CONSOLIDATION_AUDIT";

