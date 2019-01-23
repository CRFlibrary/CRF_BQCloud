CREATE OR REPLACE
PACKAGE      "APPS_DDL" AUTHID DEFINER as
/* $Header: adaddls.pls 120.0 2005/11/29 05:04:55 vpalakur noship $ */
   --
   -- Package
   --   APPS_DDL
   -- Purpose
   --   Dynamic DDL support
   -- Notes
   --   1. This package is created in each Oracle Applications account
   --   2. Each account requires the following explicit
   --      privileges to run (i.e. these privileges cannot be obtained
   --      from a role, like 'connect'):
   --      grant create session to <schema>;
   --      grant alter session to <schema>;
   --      grant create database link to <schema>;
   --      grant create synonym to <schema>;
   --      grant create view to <schema>;
   --      grant create cluster to <schema>;
   --      grant create procedure to <schema>;
   --      grant create sequence to <schema>;
   --      grant create table to <schema>;
   --      grant create trigger to <schema>;
   --   Currently AutoInstall grants the neccessary privs to each schema
   --
procedure apps_ddl(ddl_text in varchar2);
end APPS_DDL;


/

CREATE OR REPLACE
PACKAGE BODY      "APPS_DDL" as
/* $Header: adaddlb.pls 120.0 2005/11/29 05:04:44 vpalakur noship $ */
procedure apps_ddl
           (ddl_text in varchar2) is
  c              integer;
  rows_processed integer;
begin
  c := dbms_sql.open_cursor;
  dbms_sql.parse(c, ddl_text, dbms_sql.native);
  rows_processed := dbms_sql.execute(c);
  dbms_sql.close_cursor(c);
exception
  when others then
    dbms_sql.close_cursor(c);
    raise;
end apps_ddl;
end APPS_DDL;

/
