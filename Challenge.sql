--CHallenge Module 7
--Number of titles retiring
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
sa.salary
INTO retiring_title
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN salaries AS sa
ON (ti.emp_no = sa.emp_no);

--Eliminate duplicate names/emp_no
CREATE TABLE non_duplicate as (
SELECT emp_no, first_name, last_name, title, from_date, salary
FROM
  (SELECT emp_no, first_name, last_name, title, from_date, salary,
     ROW_NUMBER() OVER 
	(PARTITION BY (emp_no, first_name, last_name) 
	 ORDER BY from_date DESC) rn
   FROM retiring_title) tmp 
   WHERE rn = 1);

--create frequency table of title by date
CREATE TABLE frequency_by_title as (
SELECT title,
	from_date,
	COUNT (title)
FROM non_duplicate
GROUP BY from_date, title
ORDER BY from_date);

--table with employee number, name, title, from and to date
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date,
em.birth_date
INTO mentor_pre
FROM non_duplicate as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN employees as em
ON (e.emp_no = em.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND ti.to_date = ('9999-01-01')
;
--filter previous table
CREATE TABLE mentor_post as (
SELECT emp_no, first_name, last_name, title, from_date, to_date
FROM
  (SELECT emp_no, first_name, last_name, title, from_date, to_date, birth_date,
     ROW_NUMBER() OVER 
	(PARTITION BY (emp_no, first_name, last_name) 
	 ORDER BY from_date DESC) rn
   FROM mentor_pre) tmp 
   WHERE rn = 1);
