--DML for Department table--
SET DEFINE OFF;

INSERT INTO department VALUES (department_seq.nextval, 'Management', 'London');
INSERT INTO department VALUES (department_seq.nextval, 'Engineering', 'Cardiff');
INSERT INTO department VALUES (department_seq.nextval, 'Research & Development', 'Edinburgh');
INSERT INTO department VALUES (department_seq.nextval, 'Sales', 'Belfast');
commit;

--DML for Employee table--

INSERT INTO employee VALUES (employee_seq.nextval, 'John Smith', 'CEO', null, to_date('01/01/95','DD/MM/RR'), 100000, 1);
INSERT INTO employee VALUES (employee_seq.nextval, 'Jimmy Willis', 'Manager', null, to_date('23/09/03','DD/MM/RR'), 52500, 4);
INSERT INTO employee VALUES (employee_seq.nextval, 'Roxy Jones', 'Salesperson', null, to_date('11/02/17','DD/MM/RR'), 35000, 4);
INSERT INTO employee VALUES (employee_seq.nextval, 'Selwyn Field', 'Salesperson', null, to_date('20/05/15','DD/MM/RR'), 32000, 4);
INSERT INTO employee VALUES (employee_seq.nextval, 'David Hallett', 'Engineer', null, to_date('17/04/18','DD/MM/RR'), 40000, 2);
INSERT INTO employee VALUES (employee_seq.nextval, 'Sarah Phelps', 'Manager', null, to_date('21/03/15','DD/MM/RR'), 45000, 2);
INSERT INTO employee VALUES (employee_seq.nextval, 'Louise Harper', 'Engineer', null, to_date('01/01/13','DD/MM/RR'), 47000, 2);
INSERT INTO employee VALUES (employee_seq.nextval, 'Tina Hart', 'Engineer', null, to_date('28/07/14','DD/MM/RR'), 45000, 3);
INSERT INTO employee VALUES (employee_seq.nextval, 'Gus Jones', 'Manager', null, to_date('15/05/18','DD/MM/RR'), 50000, 3);
INSERT INTO employee VALUES (employee_seq.nextval, 'Mildred Hall', 'Secretary', null, to_date('12/10/96','DD/MM/RR'), 35000, 1);
commit;

--DML to update department_id in Employee table--

UPDATE employee
  SET manager_id = CASE employee_id
    WHEN 90002 THEN 90001
    WHEN 90003 THEN 90002
    WHEN 90004 THEN 90003
    WHEN 90005 THEN 90006
    WHEN 90006 THEN 90001
    WHEN 90007 THEN 90006
    WHEN 90008 THEN 90009
    WHEN 90009 THEN 90001
    WHEN 90010 THEN 90001
  END
WHERE employee_id IN (90002,90003,90004,90005,90006,90007,90008,90009,90010);
commit;
/