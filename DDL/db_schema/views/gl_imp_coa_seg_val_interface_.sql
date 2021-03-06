CREATE OR REPLACE VIEW GL_IMP_COA_SEG_VAL_INTERFACE# AS
select BATCH_NUMBER BATCH_NUMBER, SEG_VAL_INT_ID SEG_VAL_INT_ID, VALUE_SET_NAME VALUE_SET_NAME, FLEX_VALUE FLEX_VALUE, FLEX_DESC FLEX_DESC, PARENT_FLEX_VALUE PARENT_FLEX_VALUE, SUMMARY_FLAG SUMMARY_FLAG, ROLL_UP_GROUP ROLL_UP_GROUP, HIERARCHY_LEVEL HIERARCHY_LEVEL, ALLOW_BUDGETING ALLOW_BUDGETING, ALLOW_POSTING ALLOW_POSTING, ACCOUNT_TYPE ACCOUNT_TYPE, RECONCILE RECONCILE, THIRD_PARTY_CONTROL_ACCOUNT THIRD_PARTY_CONTROL_ACCOUNT, ENABLED_FLAG ENABLED_FLAG, EFFECTIVE_FROM EFFECTIVE_FROM, EFFECTIVE_TO EFFECTIVE_TO, STATUS STATUS from "GL"."GL_IMP_COA_SEG_VAL_INTERFACE";


