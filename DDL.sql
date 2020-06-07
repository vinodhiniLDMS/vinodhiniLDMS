--Create Department table--

create table department
(
    department_id number(5) not null,
    department_name varchar2(50 char) not null,
    dep_location varchar2(50 char) not null,
    CONSTRAINT department_pk PRIMARY KEY (department_id) 
);

--Create Employee table--

create table employee
(
    employee_id number(10) not null,
    employee_name varchar2(50 char) not null,
    job_title varchar2(50 char) not null,
    manager_id number(10) null,
    employee_hire_dt date not null,
    salary number(10) not null,
    department_id number(5) not null,
    CONSTRAINT employee_pk PRIMARY KEY (employee_id),
    CONSTRAINT employee_fk1 FOREIGN KEY (department_id) REFERENCES department(department_id),
    CONSTRAINT employee_fk2 FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

--Create Sequence for department table--
CREATE SEQUENCE department_seq
START WITH 1  
INCREMENT BY 1;
  
--Create Sequence for employee table--
CREATE SEQUENCE employee_seq
  START WITH 90001
  INCREMENT BY 1;
/