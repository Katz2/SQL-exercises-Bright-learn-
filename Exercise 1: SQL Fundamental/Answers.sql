


--Question 1
SELECT * FROM employees_db;


--Question 2
SELECT DISTINCT department FROM employees;

--Question 3
SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC;

--Question 4
SELECT first_name, last_name, salary FROM employees
  ORDER BY salary DESC
LIMIT salary 5; 


--Question 5
SELECT  first_name, last_name, department FROM employees
WHERE department = 'IT';



--Question 6
SELECT first_name, last_name, department, salary FROM employees
WHERE department = 'Finance' AND
salary > 58000;



--Question 7
SQL Query:
SELECT first_name,
last_name,
department
FROM employees
WHERE department = 'HR' OR department = 'Marketing';


--Question 8
SELECT first_name,
last_name,
department FROM employees
WHERE department != ('IT');



--Question 9
SELECT first_name,
last_name,
department FROM employees
WHERE department = ('Finance', 'HR', 'IT');


--Question 10 
SELECT first_name,
last_name,
department, city
FROM employees
WHERE department = 'IT' AND salary> 50000
AND city = 'New York';


--Question 11
SELECT first_name,
last_name,
department, salary
FROM employees
WHERE (department = 'Finance' OR department = 'Marketing')
AND salary>52000
ORDER BY salary DESC;

--Question 12
SELECT DISTINCT city FROM employees
WHERE department NOT IN ('IT, HR');


--Question 13
SELECT *, hire_date FROM employees
WHERE department !='Finance'
AND salary > 50000
ORDER BY dire_date ASC;

--Question 14
SELECT first_name,
last_name,
department,
  salary,
  city
  FROM employees
WHERE city IN( 'Chicago' OR city='Los Angeles')
AND (department ='IT', 'Marketing')
  limit 3;

--Question 15
SELECT first_name,
last_name,
department,
  salary,
  city
FROM employees
WHERE(department='IT' OR department='Finance')
AND city != 'San Francisco'
AND salary> 55000
ORDER BY salary DESC
LIMIT 5;
