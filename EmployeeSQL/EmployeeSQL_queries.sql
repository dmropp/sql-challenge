-- List employee number, last name, first name, sex, and salary for each employee
-- ##################################################

-- CREATE VIEW employee_info AS
-- SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
-- FROM employees
-- INNER JOIN salaries ON
-- salaries.emp_no=employees.emp_no;

-- SELECT * FROM employee_info;

-- List first name, last name, and hire date for employees hired in 1986
-- https://mode.com/blog/postgres-sql-date-functions/, referenced for how to use EXTRACT
-- ##################################################

-- SELECT first_name, last_name, hire_date FROM employees
-- WHERE (EXTRACT(YEAR FROM hire_date) = 1986);

-- List manager of each department along with dept number, dept name, employee number, last name, and first name
-- ##################################################
-- https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql/, referenced for how to join multiple tables

-- CREATE VIEW manager_departments AS
-- SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, departments.dept_no
-- FROM employees 
-- JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
-- JOIN departments ON departments.dept_no = dept_manager.dept_no;

-- SELECT * FROM manager_departments;

-- List the dept number for each employee as well as employee number, last name, first name, and dept name
-- ##################################################

-- CREATE VIEW employee_departments AS
-- SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
-- FROM employees
-- JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
-- JOIN departments ON departments.dept_no = dept_emp.dept_no;

-- SELECT * FROM employee_departments;

-- List first name, last name, and sex of each employee whose first name is Hercules and last name begins with B
-- ##################################################
-- https://pgpedia.info/s/starts_with.html, referenced for how to use starts_with function

-- SELECT first_name, last_name, sex 
-- FROM employees
-- WHERE first_name = 'Hercules' AND starts_with(last_name, 'B');

-- List each employee in sales including employee number, last name, and first name
-- ##################################################

-- SELECT emp_no, last_name, first_name 
-- FROM employee_departments
-- WHERE dept_name = 'Sales';

-- List each employee in sales and development including employee number, last name, first name, and dept name
-- ##################################################

-- SELECT emp_no, last_name, first_name, dept_name 
-- FROM employee_departments
-- WHERE dept_name = 'Sales' or dept_name = 'Development';

-- List how many employees share last name by last name, in descending order
-- ##################################################

-- SELECT last_name, COUNT(last_name) AS "last_name_count"
-- FROM employees
-- GROUP BY last_name
-- ORDER BY "last_name_count" DESC;