CREATE OR REPLACE VIEW GL_EFC_BUDGET_MAPPING# AS
select NCU_ID NCU_ID, MAPPING_TYPE_CODE MAPPING_TYPE_CODE, EURO_ID EURO_ID, NCU_SET_OF_BOOKS_ID NCU_SET_OF_BOOKS_ID, EURO_SET_OF_BOOKS_ID EURO_SET_OF_BOOKS_ID, LAST_UPDATE_DATE LAST_UPDATE_DATE, LAST_UPDATED_BY LAST_UPDATED_BY, LAST_UPDATE_LOGIN LAST_UPDATE_LOGIN, CREATED_BY CREATED_BY, CREATION_DATE CREATION_DATE from "GL"."GL_EFC_BUDGET_MAPPING";


