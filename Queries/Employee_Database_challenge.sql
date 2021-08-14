---Employee info and title
SELECT e.emp_no,
e.first_name,
e.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles
ON e.emp_no= titles.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Number of employyess about to retire
SELECT COUNT (ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;