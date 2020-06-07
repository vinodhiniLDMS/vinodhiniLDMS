SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
	   v_get_employee_id EMPLOYEE.EMPLOYEE_ID%TYPE;
	   v_get_department_id DEPARTMENT.DEPARTMENT_ID%TYPE;
        v_employee_id EMPLOYEE.EMPLOYEE_ID%TYPE;
	   v_department_id DEPARTMENT.DEPARTMENT_ID%TYPE;
    v_emp_count number(5);
    v_dep_count number(5);
    v_message VARCHAR2(4000 char);
BEGIN
    v_employee_id := to_number('&v_get_employee_id');
    v_department_id := to_number('&v_get_department_id');
    
    /*Validate for NULL value*/
    IF v_employee_id IS NULL THEN 
        dbms_output.put_line('Employee ID is mandatory');
    END IF;
    IF v_department_id IS NULL THEN
        dbms_output.put_line('Department ID is mandatory');
    END IF;
    
    IF v_employee_id IS NOT NULL AND v_department_id IS NOT NULL THEN    
        /*Validate if employee id and department id exists*/
        select count(employee_id) into v_emp_count from employee where employee_id = v_employee_id;
        select count(department_id) into v_dep_count from department where department_id = v_department_id;
        
        IF (v_emp_count != 0 AND v_dep_count != 0) THEN
            BEGIN
                update employee
                set department_id = v_department_id
                where employee_id = v_employee_id;
                dbms_output.put_line(to_char(SQL%ROWCOUNT)||' employee record updated');
                dbms_output.put_line('Employee transfer details:'||chr(10)|| 'Employee ID: '|| v_employee_id ||chr(10)||'New Department: '||v_department_id);
                commit;
            EXCEPTION
                WHEN OTHERS THEN
                    v_message := sqlerrm;
                    dbms_output.put_line(v_message);
            END;
        END IF;
        IF v_emp_count =0 THEN 
            dbms_output.put_line('Employee ID not valid');
        END IF;
        IF v_dep_count=0 THEN
            dbms_output.put_line('Department ID not valid');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        v_message := sqlerrm;
        dbms_output.put_line(v_message);
END;
/