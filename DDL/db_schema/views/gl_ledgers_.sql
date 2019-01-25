CREATE OR REPLACE VIEW GL_LEDGERS# AS
select LEDGER_ID LEDGER_ID, NAME NAME, SHORT_NAME SHORT_NAME, DESCRIPTION DESCRIPTION, LEDGER_CATEGORY_CODE LEDGER_CATEGORY_CODE, ALC_LEDGER_TYPE_CODE ALC_LEDGER_TYPE_CODE, OBJECT_TYPE_CODE OBJECT_TYPE_CODE, LE_LEDGER_TYPE_CODE LE_LEDGER_TYPE_CODE, COMPLETION_STATUS_CODE COMPLETION_STATUS_CODE, CONFIGURATION_ID CONFIGURATION_ID, CHART_OF_ACCOUNTS_ID CHART_OF_ACCOUNTS_ID, CURRENCY_CODE CURRENCY_CODE, PERIOD_SET_NAME PERIOD_SET_NAME, ACCOUNTED_PERIOD_TYPE ACCOUNTED_PERIOD_TYPE, FIRST_LEDGER_PERIOD_NAME FIRST_LEDGER_PERIOD_NAME, RET_EARN_CODE_COMBINATION_ID RET_EARN_CODE_COMBINATION_ID, SUSPENSE_ALLOWED_FLAG SUSPENSE_ALLOWED_FLAG, ALLOW_INTERCOMPANY_POST_FLAG ALLOW_INTERCOMPANY_POST_FLAG, TRACK_ROUNDING_IMBALANCE_FLAG TRACK_ROUNDING_IMBALANCE_FLAG, ENABLE_AVERAGE_BALANCES_FLAG ENABLE_AVERAGE_BALANCES_FLAG, CUM_TRANS_CODE_COMBINATION_ID CUM_TRANS_CODE_COMBINATION_ID, RES_ENCUMB_CODE_COMBINATION_ID RES_ENCUMB_CODE_COMBINATION_ID, NET_INCOME_CODE_COMBINATION_ID NET_INCOME_CODE_COMBINATION_ID, ROUNDING_CODE_COMBINATION_ID ROUNDING_CODE_COMBINATION_ID, ENABLE_BUDGETARY_CONTROL_FLAG ENABLE_BUDGETARY_CONTROL_FLAG, REQUIRE_BUDGET_JOURNALS_FLAG REQUIRE_BUDGET_JOURNALS_FLAG, ENABLE_JE_APPROVAL_FLAG ENABLE_JE_APPROVAL_FLAG, ENABLE_AUTOMATIC_TAX_FLAG ENABLE_AUTOMATIC_TAX_FLAG, CONSOLIDATION_LEDGER_FLAG CONSOLIDATION_LEDGER_FLAG, TRANSLATE_EOD_FLAG TRANSLATE_EOD_FLAG, TRANSLATE_QATD_FLAG TRANSLATE_QATD_FLAG, TRANSLATE_YATD_FLAG TRANSLATE_YATD_FLAG, TRANSACTION_CALENDAR_ID TRANSACTION_CALENDAR_ID, DAILY_TRANSLATION_RATE_TYPE DAILY_TRANSLATION_RATE_TYPE, AUTOMATICALLY_CREATED_FLAG AUTOMATICALLY_CREATED_FLAG, BAL_SEG_VALUE_OPTION_CODE BAL_SEG_VALUE_OPTION_CODE, BAL_SEG_COLUMN_NAME BAL_SEG_COLUMN_NAME, MGT_SEG_VALUE_OPTION_CODE MGT_SEG_VALUE_OPTION_CODE, MGT_SEG_COLUMN_NAME MGT_SEG_COLUMN_NAME, BAL_SEG_VALUE_SET_ID BAL_SEG_VALUE_SET_ID, MGT_SEG_VALUE_SET_ID MGT_SEG_VALUE_SET_ID, IMPLICIT_ACCESS_SET_ID IMPLICIT_ACCESS_SET_ID, CRITERIA_SET_ID CRITERIA_SET_ID, FUTURE_ENTERABLE_PERIODS_LIMIT FUTURE_ENTERABLE_PERIODS_LIMIT, LEDGER_ATTRIBUTES LEDGER_ATTRIBUTES, IMPLICIT_LEDGER_SET_ID IMPLICIT_LEDGER_SET_ID, LATEST_OPENED_PERIOD_NAME LATEST_OPENED_PERIOD_NAME, LATEST_ENCUMBRANCE_YEAR LATEST_ENCUMBRANCE_YEAR, PERIOD_AVERAGE_RATE_TYPE PERIOD_AVERAGE_RATE_TYPE, PERIOD_END_RATE_TYPE PERIOD_END_RATE_TYPE, BUDGET_PERIOD_AVG_RATE_TYPE BUDGET_PERIOD_AVG_RATE_TYPE, BUDGET_PERIOD_END_RATE_TYPE BUDGET_PERIOD_END_RATE_TYPE, SLA_ACCOUNTING_METHOD_CODE SLA_ACCOUNTING_METHOD_CODE, SLA_ACCOUNTING_METHOD_TYPE SLA_ACCOUNTING_METHOD_TYPE, SLA_DESCRIPTION_LANGUAGE SLA_DESCRIPTION_LANGUAGE, SLA_ENTERED_CUR_BAL_SUS_CCID SLA_ENTERED_CUR_BAL_SUS_CCID, SLA_SEQUENCING_FLAG SLA_SEQUENCING_FLAG, SLA_BAL_BY_LEDGER_CURR_FLAG SLA_BAL_BY_LEDGER_CURR_FLAG, SLA_LEDGER_CUR_BAL_SUS_CCID SLA_LEDGER_CUR_BAL_SUS_CCID, ENABLE_SECONDARY_TRACK_FLAG ENABLE_SECONDARY_TRACK_FLAG, ENABLE_REVAL_SS_TRACK_FLAG ENABLE_REVAL_SS_TRACK_FLAG, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, CREATION_DATE CREATION_DATE, CREATED_BY CREATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CONTEXT CONTEXT, ATTRIBUTE1 ATTRIBUTE1, ATTRIBUTE2 ATTRIBUTE2, ATTRIBUTE3 ATTRIBUTE3, ATTRIBUTE4 ATTRIBUTE4, ATTRIBUTE5 ATTRIBUTE5, ATTRIBUTE6 ATTRIBUTE6, ATTRIBUTE7 ATTRIBUTE7, ATTRIBUTE8 ATTRIBUTE8, ATTRIBUTE9 ATTRIBUTE9, ATTRIBUTE10 ATTRIBUTE10, ATTRIBUTE11 ATTRIBUTE11, ATTRIBUTE12 ATTRIBUTE12, ATTRIBUTE13 ATTRIBUTE13, ATTRIBUTE14 ATTRIBUTE14, ATTRIBUTE15 ATTRIBUTE15, ENABLE_RECONCILIATION_FLAG ENABLE_RECONCILIATION_FLAG, CREATE_JE_FLAG CREATE_JE_FLAG, SLA_LEDGER_CASH_BASIS_FLAG SLA_LEDGER_CASH_BASIS_FLAG, COMPLETE_FLAG COMPLETE_FLAG, COMMITMENT_BUDGET_FLAG COMMITMENT_BUDGET_FLAG, NET_CLOSING_BAL_FLAG NET_CLOSING_BAL_FLAG, AUTOMATE_SEC_JRNL_REV_FLAG AUTOMATE_SEC_JRNL_REV_FLAG from "GL"."GL_LEDGERS";

