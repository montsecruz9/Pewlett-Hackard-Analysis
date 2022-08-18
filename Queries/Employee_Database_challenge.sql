-- DELIVERABLE 1 
-- Number of Retiring Employees
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
--INTO retiring_employees
FROM employees as e
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;