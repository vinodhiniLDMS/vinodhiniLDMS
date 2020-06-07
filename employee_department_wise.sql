set echo off
set verify off
set term off
set feed off
set colsep ,
set headsep on
set pagesize 50
set trimspool off
set lin 200
set linesize 32767
set numwidth 10000
set heading on
COLUMN department FORMAT A100
column employees format A100

spool "employee_department_wise_report.csv"

SELECT (SELECT department_name FROM department WHERE department_id = e.department_id) AS "Department",LISTAGG (employee_name, '| ') WITHIN GROUP (ORDER BY department_id) "Employees" FROM employee e GROUP BY department_id ORDER BY 1;

spool off
