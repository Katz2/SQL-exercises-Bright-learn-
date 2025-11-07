--Question 1
--List all distinct departments in the students table.
SELECT DISTINCT department
FROM students;


--Question 2
--Get the average age of students per department.
SELECT department, AVG(age) AS avg_age
FROM students
GROUP BY department;

--Question 3
-- Show departments with more than 1 student.
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING COUNT(*) > 1;

--Question 4
--Get all students whose age is between 21 and 23.5. 6. 7. 
SELECT student_id, name, age, department
FROM students
WHERE age BETWEEN 21 AND 23;

--Question 5
--List all students in the IT or HR department who are older than 21.
SELECT student_id, name, age, department
FROM students
WHERE (department IN ('IT','HR')) AND age > 21;

--Question 6
--Show total credits per department, only for departments with more than 5 total credits.
SELECT department, SUM(credits) AS total_credits
FROM courses
GROUP BY department
HAVING SUM(credits) > 5;


--Question 7
--List all courses that do not have 4 credits.
SELECT course_id, course_name, department, credits
FROM courses
WHERE credits <> 4;

-- Question 8
-- Show the top 3 courses by credits in descending order.
SELECT course_id, course_name, credits
FROM courses
ORDER BY credits DESC
LIMIT 3;

--Question 9
--Get the maximum, minimum, and average grade across all enrollments.
SELECT MAX(grade) AS max_grade,
MIN(grade) AS min_grade,
AVG(grade) AS avg_grade
FROM enrollments;

-- Question 10
-- Count how many enrollments exist per course.
SELECT course_id, COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY course_id;

--Question 11
-- Find total salary and total bonus per department.
SELECT department,
SUM(salary) AS total_salary,
SUM(bonus) AS total_bonus
FROM salaries
GROUP BY department;

--Question 12
--Show departments where average salary is above 55,000.
SELECT department, AVG(salary) AS avg_salary
FROM salaries
GROUP BY department
HAVING AVG(salary) > 55000;


--Question 13
--List employees whose salary plus bonus is greater than 60,000.
SELECT employee_id, name, salary, bonus,
(salary + bonus) AS total_compensation
FROM salaries
WHERE (salary + bonus) > 60000;

--Question 14
--Show total and average budget per department. Only include departments with average budget above 70,000.
SELECT department,
SUM(budget) AS total_budget,
AVG(budget) AS avg_budget
FROM projects
GROUP BY department
HAVING AVG(budget) > 70000;

--Question 15
--List all projects with budgets between 50,000 and 120,000, excluding the Marketing department.
SELECT project_id, project_name, department, budget
FROM projects
WHERE budget BETWEEN 50000 AND 120000
AND department <> 'Marketing';
