-- DELIVERABLE 1 
-- Number of Retiring Employees
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retiring_employees
FROM employees as e
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (titles.to_date = '9999-01-01')
ORDER BY e.emp_no, titles.from_date DESC;

-- Number of employees retiring by title
SELECT COUNT(title),
	title
INTO retiring_titles_count
FROM unique_titles 
GROUP BY title
ORDER BY COUNT(title) DESC;

-- DELIVERABLE 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (titles.to_date = '9999-01-01')
ORDER BY e.emp_no;