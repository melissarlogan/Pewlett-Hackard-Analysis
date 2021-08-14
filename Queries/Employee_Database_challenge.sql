---Employee info and title
SELECT e.emp_no,
e.first_name,
e.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO challenge_titles
FROM employees as e
LEFT JOIN titles
ON e.emp_no= titles.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ct.emp_no)
ct.emp_no,
ct.first_name,
ct.last_name,
ct.title
INTO unique_titles
FROM challenge_titles as ct
ORDER BY ct.emp_no, ct.to_date DESC;

-- Number of employyess about to retire
SELECT COUNT (ut.emp_no),
ut.title
--INTO unique_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;
