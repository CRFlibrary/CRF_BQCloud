CREATE OR REPLACE VIEW GL_BALANCES_DELTA# AS
select DELTA_RUN_ID DELTA_RUN_ID, LEDGER_ID LEDGER_ID, CODE_COMBINATION_ID CODE_COMBINATION_ID, CURRENCY_CODE CURRENCY_CODE, PERIOD_NAME PERIOD_NAME, ACTUAL_FLAG ACTUAL_FLAG, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, BUDGET_VERSION_ID BUDGET_VERSION_ID, ENCUMBRANCE_TYPE_ID ENCUMBRANCE_TYPE_ID, TRANSLATED_FLAG TRANSLATED_FLAG, TEMPLATE_ID TEMPLATE_ID, PERIOD_YEAR PERIOD_YEAR, PERIOD_NUM PERIOD_NUM, PERIOD_NET_DR PERIOD_NET_DR, PERIOD_NET_CR PERIOD_NET_CR, QUARTER_TO_DATE_DR QUARTER_TO_DATE_DR, QUARTER_TO_DATE_CR QUARTER_TO_DATE_CR, PROJECT_TO_DATE_DR PROJECT_TO_DATE_DR, PROJECT_TO_DATE_CR PROJECT_TO_DATE_CR, BEGIN_BALANCE_DR BEGIN_BALANCE_DR, BEGIN_BALANCE_CR BEGIN_BALANCE_CR, PERIOD_NET_DR_BEQ PERIOD_NET_DR_BEQ, PERIOD_NET_CR_BEQ PERIOD_NET_CR_BEQ, BEGIN_BALANCE_DR_BEQ BEGIN_BALANCE_DR_BEQ, BEGIN_BALANCE_CR_BEQ BEGIN_BALANCE_CR_BEQ from "GL"."GL_BALANCES_DELTA";


