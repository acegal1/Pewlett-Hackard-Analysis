CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no,title,from_date)
);

# select * from table_name 
select * from titles
LIMIT 5;
select * from salaries
Order by to_date DESC
limit 8;