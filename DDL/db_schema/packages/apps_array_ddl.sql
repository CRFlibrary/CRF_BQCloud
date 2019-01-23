CREATE OR REPLACE
PACKAGE      "APPS_ARRAY_DDL" AUTHID DEFINER as
/* $Header: adaaddls.pls 120.0 2005/11/29 05:04:18 vpalakur noship $ */
   --
   -- Package
   --   APPS_ARRAY_DDL
   -- Purpose
   --   Dynamic DDL support for large objects needing >32K SQL statements
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
glprogtext dbms_sql.varchar2a;
procedure apps_array_ddl
           (lb           in integer,
            ub           in integer);

procedure apps_array_ddl
           (lb           in integer,
            ub           in integer,
            newline_flag in varchar2);

end APPS_ARRAY_DDL;


/

CREATE OR REPLACE
PACKAGE BODY      "APPS_ARRAY_DDL" as
/* $Header: adaaddlb.pls 120.0 2005/11/29 05:04:33 vpalakur noship $ */
procedure apps_array_ddl
           (lb           in integer,
            ub           in integer)
is
begin
  apps_array_ddl
     (lb           => lb,
      ub           => ub,
      newline_flag => 'FALSE');
end;

procedure apps_array_ddl
           (lb           in integer,
            ub           in integer,
            newline_flag in varchar2)
is
 c              integer;
 rows_processed integer;
 statement      varchar2(1000);
 lb_bind integer;
 ub_bind integer;
begin
   c := dbms_sql.open_cursor;

   /* bug 3808531, cbhati, 17/12/2004, introduced bind variables for literal
      values of parameters.
    */

   statement := 'declare l_c integer; l_rows_processed integer; '||
                'begin l_c := dbms_sql.open_cursor; '||
'dbms_sql.parse(l_c,apps_array_ddl.glprogtext,to_char(:lb_bind),to_char(:ub_bind),'||
                upper(newline_flag)||', dbms_sql.native); '||
                'l_rows_processed := dbms_sql.execute(l_c); '||
                'dbms_sql.close_cursor(l_c); end;';
   dbms_sql.parse(c,statement,dbms_sql.native);

   dbms_sql.bind_variable(c, ':lb_bind', lb);
   dbms_sql.bind_variable(c, ':ub_bind', ub);

   rows_processed := dbms_sql.execute(c);
   dbms_sql.close_cursor(c);
exception
  when others then
   dbms_sql.close_cursor(c);
   raise;
end apps_array_ddl;
end APPS_ARRAY_DDL;

/
