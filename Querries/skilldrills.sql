--number_of_people_leaving_each_department

SELECT * FROM departments;  dm
SELECT * FROM dept_manager; dm
SELECT * FROM employees; ce

SELECT * from manager_info LIMIT(10);

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary,de.dept_no, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);	
		
-- List of department_retireees		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	 
INTO dept_retirees
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);


SELECT * from departments;
select * from retirement_info 

--Skill Drill 1     Sales
Select rt.emp_no, rt.first_name, rt.last_name, de.dept_no, d.dept_name 
INTO sales_only_info
FROM retirement_info AS rt
INNER JOIN dept_emp AS de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales');

--Skill Drill 2 Sales and Development  IN is required due to creating 2 items in same column
Select rt.emp_no, rt.first_name, rt.last_name, de.dept_no, d.dept_name
INTO sales_dev_info
FROM retirement_info AS rt
INNER JOIN dept_emp AS de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales','Development');







