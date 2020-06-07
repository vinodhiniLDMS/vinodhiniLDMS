-- PL SQL block to increase/decrease salary with a percentage
-- Inputs to be given by user
-- 1. Employee ID
-- 2. Percentage of increase/decrease in salary
-- 3. Update Type (I for increase and D for decrease)

   
SET VERIFY OFF

DECLARE
    v_get_employee_id EMPLOYEE.EMPLOYEE_ID%TYPE;
    v_employee_id EMPLOYEE.EMPLOYEE_ID%TYPE;
    v_get_percentage NUMBER;
    v_percentage NUMBER;
    v_get_update_type VARCHAR2(1 char);
    v_update_type VARCHAR2(1 char);
    v_emp_count number(5);
    v_message vARCHAR2(4000 char);
BEGIN
    v_employee_id := to_number('&v_get_employee_id');
    v_percentage := nvl(to_number('&v_get_percentage'),0);
    v_update_type := UPPER('&v_get_update_type');

    IF v_update_type IS NULL THEN
        dbms_output.put_line('Select an update type');
    END IF;
    IF UPPER(v_update_type) NOT IN ('I','D') THEN
        dbms_output.put_line('Enter a valid update option : I-increase salary, D-Decrease salary');
    END IF;

    IF v_employee_id IS NULL THEN
        dbms_output.put_line('Employee ID is mandatory');
    ELSE
        /*Validate if employee id exists*/
        select count(employee_id) into v_emp_count from employee where employee_id = v_employee_id;
        
        IF v_emp_count != 0  AND v_update_type = 'I' THEN
            BEGIN
                update employee
                set salary  = salary +(salary*(v_percentage/100))
                where employee_id = v_employee_id;
                dbms_output.put_line(to_char(SQL%ROWCOUNT)||' row affected');
                commit;
            EXCEPTION
                WHEN OTHERS THEN
                    v_message := sqlerrm;
                    dbms_output.put_line(v_message);
            END;
        ELSIF v_emp_count != 0  AND v_update_type = 'D' THEN
            BEGIN
                update employee
                set salary  = salary - (salary*(v_percentage/100))
                where employee_id = v_employee_id;
                dbms_output.put_line(to_char(SQL%ROWCOUNT)||' row affected');
                commit;
            EXCEPTION
                WHEN OTHERS THEN
                    v_message := sqlerrm;
                    dbms_output.put_line(v_message);
            END;
        ELSIF v_emp_count = 0 THEN
            dbms_output.put_line('Employee ID does not exist');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('SQL Error'|| sqlcode);
END;
/