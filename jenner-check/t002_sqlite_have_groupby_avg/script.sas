/*-----------------------------------------------------------------
  Adapted from utl-utl-interface-sqlite3-with-any-language-that-
  supports-host-commands.sas (Case 2: SHELLING OUT TO SQLITE3 FROM
  SAS WITH SQL FILE).

  Upstream builds this exact `have` dataset (documented inline in
  the source as the INPUT side of the pipeline: NAME $8. SEX $1.
  AGE 8. WEIGHT 8., with cards4 rows for Alfred/Alice/Barbara/Carol/
  Henry), writes it to a sqlite3 SQL init file, and shells out to
  sqlite3.exe to run:

      create table sumize as
      select sex, cast(avg(age) as real) as avgage,
             cast(avg(weight) as real) as avgwgt
      from have group by sex;

  A hosted engine has no local sqlite3 binary and no CMD.EXE, so the
  shell-out can't run here. This bundle builds the author's exact
  `have` rows and column names (name, sex, age, weight) as a real
  SAS DATA step, then runs their exact group-by-sex average query
  natively via PROC SQL instead of sqlite3.
-----------------------------------------------------------------*/

data have;
  informat name $8. sex $1. age 8. weight 8.;
  input name sex age weight;
  datalines;
Alfred M 14 112.5
Alice F 13 84
Barbara F 13 98
Carol F 14 102.5
Henry M 14 102.5
;
run;

proc sql;
  create table sumize as
  select
     sex
    ,cast(avg(age) as float)    as avgage
    ,cast(avg(weight) as float) as avgwgt
  from
     have
  group by
     sex;
quit;

proc print data=sumize noobs;
  title "sumize: avg age/weight by sex (sqlite3 CREATE TABLE sumize AS SELECT ... GROUP BY sex, done natively)";
run;

proc contents data=sumize varnum;
  title "contents of sumize (analogous to sqlite3 PRAGMA table_info(sumize) in the original)";
run;
