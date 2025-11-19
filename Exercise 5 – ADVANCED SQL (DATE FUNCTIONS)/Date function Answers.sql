--Question 1. Add 6 months to each employee’s hire date using DATEADD().
SELECT emp_id, name, hire_date,
DATEADD(MONTH, 6, hire_date) AS hire_plus_6_months
FROM Employees;

--Question 2. Use DATEDIFF() to find age in days from dob to today.
SELECT student_id, name,
DATEDIFF(DAY, dob, CURRENT_DATE) AS age_in_days
FROM Students;

--Question 3. Find how many days are left until each event using DATEDIFF().
SELECT event_id, event_name,
DATEDIFF(DAY, CURRENT_DATE, event_date) AS days_remaining
FROM Events;

--Question 4. Calculate the number of days between issue_date and due_date.
SELECT invoice_id, issue_date, due_date,
DATEDIFF(DAY, issue_date, due_date) AS days_between
FROM Invoices;

--Question 5. Format start_date as 'Month YYYY' using TO_CHAR().
SELECT course_id, name,
TO_CHAR(start_date, 'Month YYYY') AS formatted_date
FROM Courses;

--Question 6. Create full date from parts using DATE_FROM_PARTS().
SELECT member_id,
DATEFROMPARTS(start_year, start_month, start_day) AS full_start_date
FROM Memberships;

--Q7. Extend each renewal_date by 1 year using DATEADD().
SELECT sub_id, plan,
DATEADD(YEAR, 1, renewal_date) AS extended_renewal_date
FROM Subscriptions;

--Question 8. Show current date and difference from order_date.
SELECT order_id, order_date,
CURRENT_DATE AS today_date,
DATEDIFF(DAY, order_date, CURRENT_DATE) AS days_since_order
FROM Orders;

--Question 9. Extract the year from training_date using DATE_PART() or EXTRACT().
SELECT training_id, topic,
EXTRACT(YEAR FROM training_date) AS training_year
FROM Trainings;

--Question 10. Extract hour and minute from published_on.
SELECT post_id, title,
EXTRACT(HOUR FROM published_on) AS hour_published,
EXTRACT(MINUTE FROM published_on) AS minute_published
FROM Blog_Posts;

--Question 11. Calculate days left until license expiry using DATEDIFF() and today’s date.
SELECT driver_id, license_expiry,
DATEDIFF(DAY, CURRENT_DATE, license_expiry) AS days_left
FROM Drivers;

--Q12. Display the current timestamp and calculate seconds since the message was sent.
SELECT message_id, sent_timestamp,
CURRENT_TIMESTAMP AS current_timestamp,
DATEDIFF(SECOND, sent_timestamp, CURRENT_TIMESTAMP) AS seconds_since_sent
FROM Messages;

--Question 13. Add 15 days to return_date using DATEADD() to show restock_date.
SELECT return_id, return_date,
DATEADD(DAY, 15, return_date) AS restock_date
FROM Returns;

  
--Question 14. Convert assigned_on to date using TO_DATE() (if it's stored as string).
SELECT assign_id,
TO_DATE(assigned_on, 'YYYY-MM-DD') AS assigned_on_date
FROM Assignments;


  
--Question 15 Convert scheduled_time to formatted string like 'April 19, 2025 at 2:00 PM' using TO_CHAR().
SELECT meeting_id,
TO_CHAR(scheduled_time, 'Month DD, YYYY "at" HH:MI AM') AS formatted_meeting_time
FROM Meetings;

