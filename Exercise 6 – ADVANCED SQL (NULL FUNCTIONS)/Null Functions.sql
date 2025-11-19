--Question1. Show all employees with their salary. If salary is NULL, display 0.
SELECT employee_id, name,
IFNULL(salary, 0) AS salary_with_default
FROM Employees;

--Question2. Show employee names with their department. If department is NULL, show "Not Assigned".
SELECT employee_id, name,
COALESCE(department, 'Not Assigned') AS department_name
FROM Employees;

--Question3. Find orders with NULL customer_id using ISNULL().
SELECT order_id, customer_id
FROM Orders
WHERE ISNULL(customer_id);

--Question4. Show all orders. If delivery_date is NULL, show 'Pending'.
SELECT order_id, customer_id,
COALESCE(delivery_date, 'Pending') AS delivery_status
FROM Orders;

--Q5uestion5. Show all students and their grades. Replace NULL with 0.
SELECT student_id, name,
IFNULL(grade, 0) AS final_grade
FROM Students;

--Question6. Count students who haven't been graded.
SELECT COUNT(*) AS not_graded_count
FROM Students
WHERE grade IS NULL;

--Question7. Show product name, price, and final price after discount (assume 0 if discount is NULL).
SELECT product_id, name,
price - IFNULL(discount, 0) AS final_price
FROM Products;
Expected output:

--Question8. Count how many customers have no email.
SELECT COUNT(*) AS missing_email_count
FROM Customers
WHERE email IS NULL;

--Question9. Show all customers with email. If NULL, display "No Email".
SELECT customer_id, name,
COALESCE(email, 'No Email') AS email_display
FROM Customers;

--Question10. Show payment details with method replaced by "Unknown" if NULL.
SELECT payment_id,
COALESCE(method, 'Unknown') AS method_display,
status
FROM Payments;

--Question11. Show items and their quantity (0 if NULL).
SELECT item_id, item_name,
IFNULL(quantity, 0) AS quantity_checked
FROM Inventory;

--Question12. Show employee ID and the first available value among bonus or commission.
SELECT emp_id,
COALESCE(bonus, commission, 0) AS first_available_reward
FROM Employees_Extra;

--Question13. Count classes that don’t have a room assigned.
SELECT COUNT(*) AS no_room_count
FROM Classes
WHERE room IS NULL;

--Question14. Show attendance records with status. Replace NULL with "Not Marked".
SELECT student_id, date,
COALESCE(status, 'Not Marked') AS attendance_status
FROM Attendance;

--Question15. Show account ID, account_type (or 'Unknown'), and balance (or 0).
SELECT account_id,
COALESCE(account_type, 'Unknown') AS type_display,
IFNULL(balance, 0) AS balance_checked
FROM Bank_Accounts;

--Question16. Show all projects with a start date. If start_date is NULL, display 'TBD'.
SELECT project_id, title,
COALESCE(start_date, 'TBD') AS start_display
FROM Projects;

--Question17. Display reviews showing comment (or 'No Comment') and rating (or 0).
SELECT review_id, product_id,
COALESCE(comment, 'No Comment') AS comment_display,
IFNULL(rating, 0) AS rating_display
FROM Reviews;

--Question18. Show the supplier contact number. Use COALESCE(phone, alt_phone, 'No Contact').
SELECT supplier_id, name,
COALESCE(phone, alt_phone, 'No Contact') AS contact_number
FROM Suppliers;

--Question19. Show all users and their preferences. Replace all NULLs with defaults:
SELECT user_id,
COALESCE(theme, 'Light') AS theme_set,
COALESCE(language, 'English') AS language_set,
COALESCE(timezone, 'UTC') AS timezone_set
FROM User_Settings;

--Question20. Show maintenance log with:
SELECT record_id, machine_id,
COALESCE(issue, 'Unknown Issue') AS issue_log,
COALESCE(technician, 'Not Assigned') AS technician_name
FROM Maintenance;
