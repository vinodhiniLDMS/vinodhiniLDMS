SET SERVEROUTPUT ON
SET VERIFY OFF

--PLSQL block to create an Employee--

DECLARE
	   v_get_employee_name EMPLOYEE.EMPLOYEE_NAME%TYPE;
	   v_get_job_title EMPLOYEE.JOB_TITLE%TYPE;
	   v_get_manager_id EMPLOYEE.EMPLOYEE_ID%TYPE;
	   v_get_employee_hire_dt EMPLOYEE.EMPLOYEE_HIRE_DT%TYPE;
	   v_get_salary EMPLOYEE.SALARY%TYPE;
	   v_get_department_id EMPLOYEE.DEPARTMENT_ID%TYPE;
	   
	   v_employee_name EMPLOYEE.EMPLOYEE_NAME%TYPE;
	   v_job_title EMPLOYEE.JOB_TITLE%TYPE;
	   v_manager_id EMPLOYEE.EMPLOYEE_ID%TYPE;
	   v_employee_hire_dt EMPLOYEE.EMPLOYEE_HIRE_DT%TYPE;
	   v_salary EMPLOYEE.SALARY%TYPE;
	   v_department_id EMPLOYEE.DEPARTMENT_ID%TYPE;
	   v_message VARCHAR2(4000 char);
	   v_dept_cnt NUMBER(1);
	   v_manager_cnt NUMBER(1);
	   v_error NUMBER(1) :=0;
BEGIN
    v_employee_name := to_char('&v_get_employee_name');
    v_job_title := to_char('&v_get_job_title');
    v_manager_id := to_number('&v_get_manager_id');
    v_employee_hire_dt := TO_DATE('&v_get_employee_hire_dt','YYYY-MM-DD');
    v_salary := TO_NUMBER('&v_get_salary');
    v_department_id := TO_NUMBER('&v_get_department_id');
   
    /*Null Validation for Input parameters*/
    IF v_employee_name IS NULL THEN
        dbms_output.put_line('Employee Name is mandatory');
        v_error :=1;
    END IF;
    IF v_job_title IS NULL THEN
        dbms_output.put_line('Job title is mandatory');
        v_error :=1;
    END IF;
    IF v_employee_hire_dt IS NULL THEN
        dbms_output.put_line('Employee_hire_dt is mandatory');
        v_error :=1;
    END IF;
    IF v_salary IS NULL THEN
        dbms_output.put_line('Salary is mandatory');
        v_error :=1;
    END IF;
    IF v_department_id IS NULL THEN
        dbms_output.put_line('Department_id is mandatory');
        v_error :=1;
    ELSE
        --Get Department ID and validate
        select count(department_id) into v_dept_cnt 
        from department where department_id = v_department_id;
        
        --Department ID validation
        IF v_dept_cnt = 0 THEN
            dbms_output.put_line('Department ID does not exist');
    END IF;
    END IF;
    
    
    IF v_manager_id IS NOT NULL THEN
        --Get Manager ID and validate
        select count(employee_id) into v_manager_cnt
        from employee where employee_id = v_manager_id;
        --Department ID validation
        IF v_manager_cnt = 0 THEN
            dbms_output.put_line('Manager ID does not exist');
            v_manager_id := null;
        END IF;
    END IF;
    
    IF (v_dept_cnt !=0 AND v_error = 0 ) THEN
        BEGIN
            INSERT INTO EMPLOYEE(EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, EMPLOYEE_HIRE_DT, SALARY, DEPARTMENT_ID)
            VALUES (employee_seq.nextval, v_employee_name, v_job_title, v_manager_id, v_employee_hire_dt, v_salary, v_department_id);
        
            dbms_output.put_line(to_char(SQL%ROWCOUNT)||' employee record inserted');
        EXCEPTION
            WHEN OTHERS THEN
            v_message := sqlerrm ;
dbms_output.put_line('hi');
            dbms_output.put_line('SQL Error'|| sqlerrm);    
        END;
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        v_message := sqlerrm ;
        dbms_output.put_line('SQL Error'|| sqlerrm);
END;
/

