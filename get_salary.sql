SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    v_salary EMPLOYEE.SALARY%TYPE;
    v_employee_name EMPLOYEE.EMPLOYEE_NAME%TYPE;
    v_emp_id EMPLOYEE.EMPLOYEE_ID%TYPE;
    v_message VARCHAR2(4000);
    v_get_emp_id EMPLOYEE.EMPLOYEE_ID%TYPE;
BEGIN
    v_emp_id := to_number('&v_get_emp_id');
    IF v_emp_id IS NOT NULL THEN
        BEGIN
            select salary, employee_name into v_salary, v_employee_name
            from EMPLOYEE
            where employee_id = v_emp_id;
            dbms_output.put_line('Employee ID : '||v_emp_id);
            dbms_output.put_line('Employee Name : '||v_employee_name);
            dbms_output.put_line('Salary : '||v_salary);
        EXCEPTION
            WHEN no_data_found THEN
                dbms_output.put_line('Employee ID not valid');
            WHEN OTHERS THEN
                v_message := sqlerrm;
                dbms_output.put_line(v_message);
        END;
    ELSE
        dbms_output.put_line('Employee ID is mandatory');
    END IF;
END;
/
