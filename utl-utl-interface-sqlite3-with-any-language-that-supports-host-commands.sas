%let pgm=utl-utl-interface-sqlite3-with-any-language-that-supports-host-commands;

%stop_submission;

Interface sqlite3 with any language that supports host commands

  CONTENTS SQLITE3 (May be able to do with any database that supports host commands)

     1 SHELLING OUT TO SQLITE3 WITH INLINE SQL QUERY

        a execute inline create table tst query
        b summarize tst table sqlite table
        c output column data type date to csv file
        d output summarized tst table to csv file
        e convert datatype csv to sas table
        f convert tst csv to sas table

      2 SHELLING OUT TO SQLITE3 FROM SAS WITH SQL FILE

        a create file with create table query
        b summarize tst table sqlite table
        c output column data type date to csv file
        d output summarized tst table to csv file
        e convert datatype csv to sas table
        f convert tst csv to sas table

      3 SQLITE3, POSTGRESQL AND POWERSHELL  CLI COMMANDS AND META COMMANDS

SOAPBOX ON
  The personal version of WPS/ALTAIR/SIEMENS DOES NOT HAVE AN OPERATING SYSTEM
SOAPBOX OFF

github
https://tinyurl.com/4t54tcfc
https://github.com/rogerjdeangelis/utl-utl-interface-sqlite3-with-any-language-that-supports-host-commands

MAKE SURE ALL COMMAND WINDOWS ARE CLOSED BEFORE RERUNNING OR REMOVE CMD /K
'CMD /K' IS USEFULL FOR TESTING


Related repos
github
https://tinyurl.com/yrzh99mt
https://github.com/rogerjdeangelis/utl-connecting-spss-pspp-to-postgresql-sample-problem-compute-mean-weight-by-sex

github
https://tinyurl.com/5mpbc23d
https://github.com/rogerjdeangelis/utl-creating-sqlite-and-postgresql-tables-from-sas-datasets-without-sas-access-and-a-blueprint

x 'cmd /K sqlite3 c:/temp/tst.db ".quit"';
x 'cmd /K sqlite3 c:/temp/tst.db ".exit"';

/**************************************************************************************************************************/
/* INPUT                      | PROCESS                                                       | OUTPUT                    */
/* ====                       | =======                                                       | ======                    */
/* INLINE INPUT               | 1 SHELLING OUT TO SQLITE3 WITH INLINE SQL QUERY               | IN CMD.EXE WINDOW         */
/*                            | ===============================================               | (select * from tst)       */
/*                            |                                                               |                           */
/*                            | %utlfkil(c:/temp/tst.db);                                     | 100.0                     */
/*                            | %utlfkil(c:/temp/csvtst.csv);                                 | 200.0                     */
/*                            | %utlfkil(c:/temp/csvmeta.csv);                                | 300.0                     */
/*                            |                                                               | 400.0                     */
/*                            | proc datasets lib=sd1 nolist nodetails;                       |                           */
/*                            |  delete want meta;                                            | CSVs                      */
/*                            | run;quit;                                                     |                           */
/*                            |                                                               | c:/temp/csvmeta.csv       */
/*                            | /*---- sqlite3 creates db if it does not exist ----*/         |                           */
/*                            | /*---- remove cmd /K or set up stdout          ----*/         | cid,name,type,            */
/*                            |                                                               |  notnull,dflt_value,pk    */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db "drop table if exists tst"'; |                           */
/*                            |                                                               | 0,val,REAL,0,,0           */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db                              | 1,x2,"",0,,0              */
/*                            |    "create                                                    |                           */
/*                            |        table tst (val real);                                  | c:/temp/csvtst.csv        */
/*                            |     insert                                                    |                           */
/*                            |       into tst(val)                                           | val,x2                    */
/*                            |     values                                                    | 100.0,200.0               */
/*                            |       (100),(200),(300),(400);"';                             | 200.0,400.0               */
/*                            |                                                               | 300.0,600.0               */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db ".tables"';                  | 400.0,800.0               */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db "select * from tst"';        |                           */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                 | SAS                       */
/*                            |   "create                                                     |                           */
/*                            |       table x2 as                                             | WORK.META total obs=2     */
/*                            |    select                                                     |               NOT         */
/*                            |       val                                                     | CID NAME TYPE NULL DFLT PK*/
/*                            |      ,cast(2*val as real) as x2                               |                           */
/*                            |    from                                                       | 0  val  REAL  0         0 */
/*                            |       tst;"';                                                 | 1  x2   REAL  0         0 */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                 |                           */
/*                            |    "select                                                    | WORK WANT total obs=4     */
/*                            |        *                                                      |                           */
/*                            |     from                                                      | VAL     X2                */
/*                            |        x2;" > c:/temp/csvtst.csv';                            |                           */
/*                            | x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                 | 100    200                */
/*                            |    "PRAGMA table_info(x2);" > c:/temp/csvmeta.csv';           | 200    400                */
/*                            |                                                               | 300    600                */
/*                            | dm "dimport 'c:/temp/csvtst.csv' want replace";               | 400    800                */
/*                            | dm "dimport 'c:/temp/csvmeta.csv' meta replace";              |                           */
/*                            |                                                               |                           */
/*                            |                                                               |                           */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                            |                                                               |                           */
/* c:/temp/sqlcreins.sq       |2 SHELLING OUT TO SQLITE3 FROM SAS WITH SQL FILE               | IN CMD.EXE WINDOW         */
/*                            |================================================               | select * from have        */
/* Create table have(         |                                                               |                           */
/*   name varchar(200)        |                                                               | Alice|F|13.0|84.0         */
/*   ,sex varchar(200)        |%utlfkil(c:/temp/tst.db);                                      | Barbara|F|13.0|98.0       */
/*   ,age float               |%utlfkil(c:/temp/csvtst.csv);                                  | Carol|F|14.0|102.5        */
/*   ,weight float);          |%utlfkil(c:/temp/csvmeta.csv);                                 | Henry|M|14.0|102.5        */
/* Insert                     |                                                               |                           */
/*   into                     |proc datasets lib=sd1 nolist nodetails;                        | CSVs                      */
/* have(name,sex,age,weight)  | delete want meta;                                             |                           */
/* VALUES                     |run;quit;                                                      | c:/temp/csvmeta.csv       */
/* ('Alice', 'F', 13, 84.0),  |                                                               |                           */
/* ('Barbara', 'F', 13, 98.0),|/*---- sqlite3 creates db if it does not exist ----*/          | cid,name,type,            */
/* ('Carol', 'F', 14, 102.5), |/*---- remove cmd /K or set up stdout          ----*/          |   notnull,dflt_value,pk   */
/* ('Henry', 'M', 14, 102.5); |                                                               |                           */
/*                            |x 'cmd /K sqlite3 c:/temp/tst.db "drop table if exists tst"';  | 0,sex,TEXT,0,,0           */
/*                            |                                                               | 1,avgage,"",0,,0          */
/* %utlfkil(                  |                                                               | 2,avgwgt,"",0,,0          */
/* c:/temp/sqlcreins.sql);    |x 'cmd /K sqlite3 c:/temp/tst.db -init c:/temp/sqlcreins.sql'; |                           */
/*                            |                                                               |                           */
/* data have;                 |x 'cmd /K sqlite3 c:/temp/tst.db ".tables"';                   |                           */
/* informat                   |x 'cmd /K sqlite3 c:/temp/tst.db "select * from have"';        | c:/temp/csvtst.csv        */
/*   NAME $8.                 |x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                  |                           */
/*   SEX $1.                  |  "create                                                      | sex,avgage,avgwgt         */
/*   AGE 8.                   |      table sumize as                                          | F,13.3333333 ,94.8333333  */
/*   WEIGHT 8.                |   select                                                      | M,14.0,102.5              */
/* ;                          |      sex                                                      |                           */
/* input                      |     ,cast(avg(age) as real)    as avgage                      |                           */
/*  NAME SEX AGE WEIGHT;      |     ,cast(avg(weight) as real) as avgwgt                      |                           */
/* cards4;                    |   from                                                        | WORK.META total obs=3     */
/* Alfred M 14 112.5          |      have                                                     |                           */
/* Alice F 13 84              |   group                                                       |                NOT     P  */
/* Barbara F 13 98            |      by sex;"';                                               | CID NAME  TYPE NUL DFL K  */
/* Carol F 14 102.5           |x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                  |                           */
/* Henry M 14 102.5           |   "select                                                     |  0  sex    TEXT  0     0  */
/* ;;;;                       |       *                                                       |  1  avgage REAL  0     0  */
/* run;quit;                  |    from                                                       |  2  avgwgt REAL  0     0  */
/*                            |       sumize;" > c:/temp/csvtst.csv';                         |                           */
/* ods path (prepend)         |x 'cmd /K sqlite3 c:/temp/tst.db -csv -header                  | WORK.WANT                 */
/* sasuser.templates(update); |   "PRAGMA table_info(sumize);" > c:/temp/csvmeta.csv';        |                           */
/* %utl_sqlinsert(            |                                                               |  SEX   AVGAGE  AVGWGT     */
/*  have                      |dm "dimport 'c:/temp/csvtst.csv' want replace";                |                           */
/* ,c:/temp/sqlcreins.sql);   |dm "dimport 'c:/temp/csvmeta.csv' meta replace";               |   F   13.3333  94.833     */
/*                            |                                                               |   M   14.0000  102.500    */
/**************************************************************************************************************************/

/*   _       _ _                        _                               _ _
/ | (_)_ __ | (_)_ __   ___   ___  __ _| |   __ _ _   _  ___ _ __ _   _( | )
| | | | `_ \| | | `_ \ / _ \ / __|/ _` | |  / _` | | | |/ _ \ `__| | | |/|/
| | | | | | | | | | | |  __/ \__ \ (_| | | | (_| | |_| |  __/ |  | |_| |
|_| |_|_| |_|_|_|_| |_|\___| |___/\__, |_|  \__, |\__,_|\___|_|   \__, |
 _                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

NO EXTERNAL INPUT
THE CREATE TABLE TEXT IS INLINE

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utlfkil(c:/temp/tst.db);
%utlfkil(c:/temp/csvtst.csv);
%utlfkil(c:/temp/csvmeta.csv);

proc datasets lib=sd1 nolist nodetails;
 delete want meta;
run;quit;

/*---- sqlite3 creates db if it does not exist ----*/
/*---- remove cmd /K or set up stdout          ----*/

x 'cmd /K sqlite3 c:/temp/tst.db "drop table if exists tst"';

x 'cmd /K sqlite3 c:/temp/tst.db
   "create
       table tst (val real);
    insert
      into tst(val)
    values
      (100),(200),(300),(400);"';

x 'cmd /K sqlite3 c:/temp/tst.db ".tables"';
x 'cmd /K sqlite3 c:/temp/tst.db "select * from tst"';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
  "create
      table x2 as
   select
      val
     ,cast(2*val as real) as x2
   from
      tst;"';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
   "select
       *
    from
       x2;" > c:/temp/csvtst.csv';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
   "PRAGMA table_info(x2);" > c:/temp/csvmeta.csv';

dm "dimport 'c:/temp/csvtst.csv' want replace";
dm "dimport 'c:/temp/csvmeta.csv' meta replace";

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*  OUTPUT                                                                                                                */
/*  ======                                                                                                                */
/*  IN CMD.EXE WINDOW                                                                                                     */
/*  (select * from tst)                                                                                                   */
/*                                                                                                                        */
/*  100.0                                                                                                                 */
/*  200.0                                                                                                                 */
/*  300.0                                                                                                                 */
/*  400.0                                                                                                                 */
/*                                                                                                                        */
/*  CSVs                                                                                                                  */
/*                                                                                                                        */
/*  c:/temp/csvmeta.csv                                                                                                   */
/*                                                                                                                        */
/*  cid,name,type,                                                                                                        */
/*   notnull,dflt_value,pk                                                                                                */
/*                                                                                                                        */
/*  0,val,REAL,0,,0                                                                                                       */
/*  1,x2,"",0,,0                                                                                                          */
/*                                                                                                                        */
/*  c:/temp/csvtst.csv                                                                                                    */
/*                                                                                                                        */
/*  val,x2                                                                                                                */
/*  100.0,200.0                                                                                                           */
/*  200.0,400.0                                                                                                           */
/*  300.0,600.0                                                                                                           */
/*  400.0,800.0                                                                                                           */
/*                                                                                                                        */
/*  SAS                                                                                                                   */
/*                                                                                                                        */
/*  WORK.META total obs=2                                                                                                 */
/*                NOT                                                                                                     */
/*  CID NAME TYPE NULL DFLT PK                                                                                            */
/*                                                                                                                        */
/*  0  val  REAL  0         0                                                                                             */
/*  1  x2   REAL  0         0                                                                                             */
/*                                                                                                                        */
/*  WORK WANT total obs=4                                                                                                 */
/*                                                                                                                        */
/*  VAL     X2                                                                                                            */
/*                                                                                                                        */
/*  100    200                                                                                                            */
/*  200    400                                                                                                            */
/*  300    600                                                                                                            */
/*  400    800                                                                                                            */
/**************************************************************************************************************************/

/*___              _    __ _ _                      _       _
|___ \   ___  __ _| |  / _(_) | ___   ___  ___ _ __(_)_ __ | |_
  __) | / __|/ _` | | | |_| | |/ _ \ / __|/ __| `__| | `_ \| __|
 / __/  \__ \ (_| | | |  _| | |  __/ \__ \ (__| |  | | |_) | |_
|_____| |___/\__, |_| |_| |_|_|\___| |___/\___|_|  |_| .__/ \__|
 _              |_|  _                               |_|
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

%utlfkil(c:/temp/tst.db);
%utlfkil(c:/temp/csvtst.csv);
%utlfkil(c:/temp/csvmeta.csv);

proc datasets lib=sd1 nolist nodetails;
 delete want meta;
run;quit;

/*---- sqlite3 creates db if it does not exist ----*/
/*---- remove cmd /K or set up stdout          ----*/

x 'cmd /K sqlite3 c:/temp/tst.db "drop table if exists tst"';


x 'cmd /K sqlite3 c:/temp/tst.db -init c:/temp/sqlcreins.sql';

x 'cmd /K sqlite3 c:/temp/tst.db ".tables"';
x 'cmd /K sqlite3 c:/temp/tst.db "select * from have"';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
  "create
      table sumize as
   select
      sex
     ,cast(avg(age) as real)    as avgage
     ,cast(avg(weight) as real) as avgwgt
   from
      have
   group
      by sex;"';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
   "select
       *
    from
       sumize;" > c:/temp/csvtst.csv';
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header
   "PRAGMA table_info(sumize);" > c:/temp/csvmeta.csv';

dm "dimport 'c:/temp/csvtst.csv' want replace";
dm "dimport 'c:/temp/csvmeta.csv' meta replace";

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* IN CMD.EXE WINDOW                                                                                                      */
/* select * from have                                                                                                     */
/*                                                                                                                        */
/* Alice|F|13.0|84.0                                                                                                      */
/* Barbara|F|13.0|98.0                                                                                                    */
/* Carol|F|14.0|102.5                                                                                                     */
/* Henry|M|14.0|102.5                                                                                                     */
/*                                                                                                                        */
/* CSVs                                                                                                                   */
/*                                                                                                                        */
/* c:/temp/csvmeta.csv                                                                                                    */
/*                                                                                                                        */
/* cid,name,type,                                                                                                         */
/*   notnull,dflt_value,pk                                                                                                */
/*                                                                                                                        */
/* 0,sex,TEXT,0,,0                                                                                                        */
/* 1,avgage,"",0,,0                                                                                                       */
/* 2,avgwgt,"",0,,0                                                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/*                                                                                                                        */
/* c:/temp/csvtst.csv                                                                                                     */
/*                                                                                                                        */
/* sex,avgage,avgwgt                                                                                                      */
/* F,13.3333333 ,94.8333333                                                                                               */
/* M,14.0,102.5                                                                                                           */
/*                                                                                                                        */
/*                                                                                                                        */
/*                                                                                                                        */
/* WORK.META total obs=3                                                                                                  */
/*                                                                                                                        */
/*                NOT     P                                                                                               */
/* CID NAME  TYPE NUL DFL K                                                                                               */
/*                                                                                                                        */
/*  0  sex    TEXT  0     0                                                                                               */
/*  1  avgage REAL  0     0                                                                                               */
/*  2  avgwgt REAL  0     0                                                                                               */
/*                                                                                                                        */
/* WORK.WANT                                                                                                              */
/*                                                                                                                        */
/*  SEX   AVGAGE  AVGWGT                                                                                                  */
/*                                                                                                                        */
/*   F   13.3333  94.833                                                                                                  */
/*   M   14.0000  102.500                                                                                                 */
/**************************************************************************************************************************/

                                                 _                            _                                   _          _ _
/*____             _ _ _         _ __   ___  ___| |_ __ _ _ __ ___  ___  __ _| | _ __   _____      _____ _ __ ___| |__   ___| | |
|___ /   ___  __ _| (_) |_ ___  | `_ \ / _ \/ __| __/ _` | `__/ _ \/ __|/ _` | || `_ \ / _ \ \ /\ / / _ \ `__/ __| `_ \ / _ \ | |
  |_ \  / __|/ _` | | | __/ _ \ | |_) | (_) \__ \ || (_| | | |  __/\__ \ (_| | || |_) | (_) \ V  V /  __/ |  \__ \ | | |  __/ | |
 ___) | \__ \ (_| | | | ||  __/ | .__/ \___/|___/\__\__, |_|  \___||___/\__, |_|| .__/ \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_|
|____/  |___/\__, |_|_|\__\___| |_|                 |___/                  |_|  |_|
*/
                 _                            _        _ _
 _ __   ___  ___| |_ __ _ _ __ ___  ___  __ _| |   ___| (_)
| `_ \ / _ \/ __| __/ _` | `__/ _ \/ __|/ _` | |  / __| | |
| |_) | (_) \__ \ || (_| | | |  __/\__ \ (_| | | | (__| | |
| .__/ \___/|___/\__\__, |_|  \___||___/\__, |_|  \___|_|_|
|_|                 |___/                  |_|


psql CLI options

-d <dbname>      Specify the database name to connect to
-U <username>    Specify the database user
-h <host>        Specify the database server host
-p <port>        Specify the port number
-W               Force password prompt
-c "<command>"   Execute a single command and exit
-f <filename>    Execute commands from a file
--csv            Output results in CSV format
-a               Echo all input lines
-A               Unaligned output mode
-b               Echo failed SQL commands to stderr


psql meta commands

\l               List all databases
\c <dbname>      Connect to another database
\dt              List all tables
\d <table>       Describe a table (columns, types, etc.)
\dn              List all schemas
\df              List all functions
\dv              List all views
\du              List all users and roles
\g               Execute the previous command again
\s               Show command history
\i <file>        Execute commands from a file


           _ _ _       _____        _ _
 ___  __ _| (_) |_ ___|___ /    ___| (_)
/ __|/ _` | | | __/ _ \ |_ \   / __| | |
\__ \ (_| | | | ||  __/___) | | (__| | |
|___/\__, |_|_|\__\___|____/   \___|_|_|
        |_|
*/

sqlite3 cli

Option / Flag   Description
-init file      Read and execute commands from the specified file (can contain SQL and meta-commands).
-echo           Print commands before execution.
-[no]header     Turn headers on or off in query output.
-column         Display query results in a table-like format with aligned columns.
-html           Output query results as simple HTML tables.
-line           Display each value on a separate line, rows separated by a blank line.
-list           Display results separated by the field separator (default: `
-separator SEP  Set the output field separator (default: `
-nullvalue STR  Set the string used to represent NULL values (default: empty string).
-version        Show the SQLite version and exit.
-help           Show help on available options and exit.
-bail           Stop after hitting an error.
-batch          Force batch I/O mode (useful for scripts).
-cmd COMMAND    Run the specified command before reading from stdin. Can be used multiple times.
-csv            Set output mode to CSV (comma-separated values).
-interactive    Force interactive I/O mode.
-mmap N         Set the default memory-mapped I/O size to N.
-stats          Print memory stats before each finalize.
-vfs NAME       Use the specified VFS (Virtual File System) implementation.

sqlite3 meta commands

  COMMAND                 DESCRIPTION

 .backup ?DB? FILE       Backup DB (default "main") to FILE
 .bail on                off
 .clone NEWDB            Clone data into NEWDB from the existing database
 .databases              List names and files of attached databases
 .dump ?TABLE? ...       Dump the database in SQL text format
 .echo on                off
 .eqp on                 off
 .exit, .quit            Exit the sqlite3 program
 .explain ?on            off?
 .fullschema             Show schema and content of sqlite_stat tables
 .headers on             off
 .help                   Show help for meta-commands
 .import FILE TABLE      Import data from FILE into TABLE
 .indices ?TABLE?        Show names of all indices (optionally for TABLE)
 .load FILE ?ENTRY?      Load an extension library
 .log FILE               off
 .mode MODE              Set output mode (csv, column, html, insert, line, list, tabs, tcl)
 .nullvalue STRING       Set string used to represent NULL values
 .once FILENAME          Output next query to FILENAME
 .open ?OPTIONS? FILE    Close existing and reopen FILE
 .output FILENAME        Send output to FILENAME
 .print STRING...        Print literal STRING
 .prompt MAIN CONT       Replace the standard prompts
 .read FILENAME          Execute commands from FILENAME
 .restore ?DB? FILE      Restore DB (default "main") from FILE
 .save FILE              Write database to FILE
 .scanstats on           off
 .schema ?PATTERN?       Show CREATE statements matching PATTERN
 .separator COL ?ROW?    Change column/row separators
 .session ?NAME? CMD     Create or control sessions
 .sha3sum ...            Compute SHA3 hash of database content
 .shell CMD ARGS...      Run CMD ARGS in a system shell
 .show                   Show current settings
 .stats ?ARG?            Show stats or turn stats on/off
 .system CMD ARGS...     Run CMD ARGS in a system shell
 .tables ?PATTERN?       List names of tables matching PATTERN
 .timeout MS             Set busy timeout to MS milliseconds
 .timer on               off
 .trace ?OPTIONS?        Output each SQL statement as it is run
 .unmodule NAME ...      Unregister virtual table modules

                                   _          _ _        _ _
 _ __   _____      _____ _ __ ___| |__   ___| | |   ___| (_)
| `_ \ / _ \ \ /\ / / _ \ `__/ __| `_ \ / _ \ | |  / __| | |
| |_) | (_) \ V  V /  __/ |  \__ \ | | |  __/ | | | (__| | |
| .__/ \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_|  \___|_|_|
|_|

Powershell cli options

-NoLogo                     Starts PowerShell without displaying the logo.
-NoExit                     Keeps the PowerShell window open after executing a command or script.
-NoProfile                  Starts without running profile scripts.
-ExecutionPolicy <policy>   Sets the session's script execution policy (e.g., Restricted, RemoteSigned).
-File <filePath> [args]     Runs the specified script file with optional arguments.
-Command <command>          Executes the specified command or script block and then exits.
`-InputFormat <Text         XML>`
`-OutputFormat <Text        XML>`
-WindowStyle <style>        Sets the window style (Normal, Minimized, Maximized, Hidden).
-Version <version>          Starts a session using the specified version of PowerShell.
-Sta                        Starts PowerShell using single-threaded apartment mode.
-Mta                        Starts PowerShell using multi-threaded apartment mode.
-Help, -?, /help            Displays help for PowerShell CLI options.
-NonInteractive             Does not present prompts to the user.
-EncodedCommand <Base64>    Executes a Base64-encoded command string.
-EncodedArguments <Base64>  Passes Base64-encoded arguments to the command.
-PSConsoleFile <file>       Loads specified Windows PowerShell console file.
-ConfigurationName <name>   Specifies a session configuration.

Powershell meta commands

Get-Command
   Lists all available cmdlets, functions, workflows, aliases, and scripts in your session.
   Example: Get-Command

Get-Help
   Provides detailed help for cmdlets and concepts.
   Example: Get-Help Get-Process

Get-Alias
   Lists all aliases defined in the current session.
   Example: Get-Alias

Get-Module
   Shows all modules loaded in the session or available to load.
   Example: Get-Module -ListAvailable

Set-ExecutionPolicy
   Changes the user or machine policy for script execution.
   Example: Set-ExecutionPolicy RemoteSigned

Import-Module / Remove-Module
   Loads or unloads PowerShell modules.

Get-PSDrive
   Lists all PowerShell drives (file system, registry, etc.).

Get-Variable / Set-Variable
   Views or sets PowerShell variables.

Get-History / Invoke-History
   Views or reruns previous commands.

Clear-Host
   Clears the console window (alias: cls).

Exit
   Exits the current PowerShell session.


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
