-- Create Additional Lists Mod 7.3.5
-- 1. Employee Information: 
--	A list of employees containing their unique employee number, 
--	their last name, 
--	first name, 
--	gender,
--	and salary
-- Final table  created emp_info table

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info2
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)

INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
LIMIT 8;
SELECT * from emp_info
Limit 8;


--2. Management: 
--	A list of managers for each department, 
--	including the department number,
--	name,
-- 	and the manager's employee number,
-- 	last name,
-- 	first name,
-- 	and the starting and ending employment dates
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
-- INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);	



-- 3. Department Retirees: An updated current_emp list that includes everything it currently has,
-- 	but also the employee's departments
-- List of department_retireees		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	 
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);


