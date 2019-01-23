CREATE OR REPLACE VIEW GL_SUMMARY_TEMPLATES# AS
select TEMPLATE_ID TEMPLATE_ID, LEDGER_ID LEDGER_ID, STATUS STATUS, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, TEMPLATE_NAME TEMPLATE_NAME, CONCATENATED_DESCRIPTION CONCATENATED_DESCRIPTION, ACCOUNT_CATEGORY_CODE ACCOUNT_CATEGORY_CODE, FUNDS_CHECK_LEVEL_CODE FUNDS_CHECK_LEVEL_CODE, MAX_CODE_COMBINATION_ID MAX_CODE_COMBINATION_ID, START_ACTUALS_PERIOD_NAME START_ACTUALS_PERIOD_NAME, AMOUNT_TYPE AMOUNT_TYPE, BOUNDARY_CODE BOUNDARY_CODE, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE, DR_CR_CODE DR_CR_CODE, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, FUNDING_BUDGET_VERSION_ID FUNDING_BUDGET_VERSION_ID, SEGMENT1_TYPE SEGMENT1_TYPE, SEGMENT2_TYPE SEGMENT2_TYPE, SEGMENT3_TYPE SEGMENT3_TYPE, SEGMENT4_TYPE SEGMENT4_TYPE, SEGMENT5_TYPE SEGMENT5_TYPE, SEGMENT6_TYPE SEGMENT6_TYPE, SEGMENT7_TYPE SEGMENT7_TYPE, SEGMENT8_TYPE SEGMENT8_TYPE, SEGMENT9_TYPE SEGMENT9_TYPE, SEGMENT10_TYPE SEGMENT10_TYPE, SEGMENT11_TYPE SEGMENT11_TYPE, SEGMENT12_TYPE SEGMENT12_TYPE, SEGMENT13_TYPE SEGMENT13_TYPE, SEGMENT14_TYPE SEGMENT14_TYPE, SEGMENT15_TYPE SEGMENT15_TYPE, SEGMENT16_TYPE SEGMENT16_TYPE, SEGMENT17_TYPE SEGMENT17_TYPE, SEGMENT18_TYPE SEGMENT18_TYPE, SEGMENT19_TYPE SEGMENT19_TYPE, SEGMENT20_TYPE SEGMENT20_TYPE, SEGMENT21_TYPE SEGMENT21_TYPE, SEGMENT22_TYPE SEGMENT22_TYPE, SEGMENT23_TYPE SEGMENT23_TYPE, SEGMENT24_TYPE SEGMENT24_TYPE, SEGMENT25_TYPE SEGMENT25_TYPE, SEGMENT26_TYPE SEGMENT26_TYPE, SEGMENT27_TYPE SEGMENT27_TYPE, SEGMENT28_TYPE SEGMENT28_TYPE, SEGMENT29_TYPE SEGMENT29_TYPE, SEGMENT30_TYPE SEGMENT30_TYPE, DESCRIPTION DESCRIPTION, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, CONTEXT CONTEXT from "GL"."GL_SUMMARY_TEMPLATES";


