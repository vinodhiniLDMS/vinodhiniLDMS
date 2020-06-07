set serveroutput on
set echo off
set verify off
set term off
set feed off
set colsep ,
set headsep on
set pagesize 50
set trimspool off
set linesize 32767
set numwidth 10000
set heading on
spool "employee_salary_summation_report.csv"

select e.department_id, d.department_name, sum(e.salary) Employee_total_salary from employee e, department d where e.department_id = d.department_id group by e.department_id, d.department_name order by e.department_id;
spool off
