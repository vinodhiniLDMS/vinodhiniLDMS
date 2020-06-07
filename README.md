# vinodhiniLDMS
Reporsitory for MVP for widget ltd (LDMB)

Build Instructions for Windows:
-------------------------------
Prerequisites: Oracle client 12c.

Steps:

1. Download the repository files to a folder on your Windows machine.
2. Launch command prompt
3. Navigate to the folder path where the repository files are stored by using the following command:
   eg: cd <directory_path>
4. Connect to sql*plus with username and password
   eg: sql*plus username/password@host
5. Run the scripts in the sequential order to create data structures, load data and run plsql blocks to get desired output.

Execution Order

1. @DDL.sql
2. @DML.sql


Run Instructions:
-----------------
When each sql file is executed, user is prompted for inputs. Please enter appropriate inputs.

1. @create_employee.sql
	Inputs to be given: Employee_Name, Job_title, Manager_ID, Employee_hire_date, Salary, Department_ID
 
2. @update_salary.sql
	Inputs to be given: Employee_ID, Percentage of increase/decrease in salary, Update Type (I - increase, D- decrease)
 
3. @transfer_employee.sql 
	Inputs to be given: Employee_ID, Department_ID

4. @get_salary.sql 
	Inputs to be given: Employee_ID

5. @employee_department_wise.sql 
	Report name created : "employee_departent_wise_report.csv"
	Report Path: Same path as the sql file (employee_department_wise.sql)

6. @employee_salary_summation.sql
	Report name created : "employee_salary_summation_report.csv"
	Report Path: Same path as the sql file (employee_salary_summation.sql)

