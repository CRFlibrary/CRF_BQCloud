CREATE OR REPLACE VIEW GL_IMP_COA_NORM_HIER_INTERFAC# AS
select BATCH_NUMBER BATCH_NUMBER, NORM_HIER_INT_ID NORM_HIER_INT_ID, VALUE_SET_NAME VALUE_SET_NAME, PARENT_FLEX_VALUE PARENT_FLEX_VALUE, RANGE_ATTRIBUTE RANGE_ATTRIBUTE, CHILD_FLEX_VALUE_LOW CHILD_FLEX_VALUE_LOW, CHILD_FLEX_VALUE_HIGH CHILD_FLEX_VALUE_HIGH, STATUS STATUS from "GL"."GL_IMP_COA_NORM_HIER_INTERFACE";

