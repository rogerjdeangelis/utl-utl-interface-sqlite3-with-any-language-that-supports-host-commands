/*-----------------------------------------------------------------
  Adapted from utl-utl-interface-sqlite3-with-any-language-that-
  supports-host-commands.sas (Case 1: SHELLING OUT TO SQLITE3 WITH
  INLINE SQL QUERY).

  Upstream shells out to sqlite3.exe via `x 'cmd /K sqlite3 ...'`
  host commands to run:

      create table tst (val real);
      insert into tst(val) values (100),(200),(300),(400);
      create table x2 as select val, cast(2*val as real) as x2 from tst;

  A hosted engine has no local sqlite3 binary and no CMD.EXE, so the
  host-command shell-out itself cannot run here. This bundle keeps
  the author's exact table name (tst), column names (val, x2), and
  literal data (100, 200, 300, 400), and reproduces the same create
  + insert + derive-x2 logic natively in SAS via a DATA step and
  PROC SQL instead of shelling out to sqlite3.
-----------------------------------------------------------------*/

data tst;
  input val;
  datalines;
100
200
300
400
;
run;

proc sql;
  create table x2 as
  select
     val
    ,cast(2*val as float) as x2
  from
     tst;
quit;

proc print data=x2 noobs;
  title "x2: val and derived x2 = 2*val (sqlite3 CREATE TABLE x2 AS SELECT, done natively)";
run;

proc contents data=x2 varnum;
  title "contents of x2 (analogous to sqlite3 PRAGMA table_info(x2) in the original)";
run;
