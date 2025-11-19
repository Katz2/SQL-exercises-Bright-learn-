
--1. Unique Customer Names
--List all unique customer names from both tables using UNION.
---Output Columns: customer_name
SELECT customer_name
FROM online_sales
UNION 
SELECT customer_name
FROM store_sales;
 

--2. All Customers (Including Duplicates)
--List all customer names from both tables using UNION ALL.
--Output Columns: customer_name
SELECT customer_name
FROM online_sales
UNION ALL 
SELECT customer_name
FROM store_sales;

-- 3. Unique Sale Dates
-- Show all unique sale dates from both tables in ascending order.
-- Output Columns: sale_date
SELECT scales_date
FROM online_sales 
ORDER BY sales_date ASC 
UNION 
SELECT scales,
FROM store_sales
ORDER BY sales_date ASC;


-- 4. All Sale Dates (Including Duplicates)
-- List all sale dates (with duplicates) using UNION ALL.
-- Output Columns: sale_date
SELECT scale_date,
FROM online_sales
UNION ALL
SELECT scale_date
FROM store_sales;

-- 5. High-Value Customers
-- Combine both tables and list unique customers who made purchases greater than 250.
-- Output Columns: customer_name, amount
SELECT customer_name, amount
FROM online_sales
WHERE amount > 250 
UNION 
SELECT customer_name, amount,
FROM store_sales
WHERE amount>250;

-- 6. Combined Sales Data
-- Combine all records from both tables using UNION ALL.
-- Output Columns: customer_name, amount, sale_date
SELECT customer_name, amount, scale_date,
FROM online_scales
UNION ALL
SELECT customer_name, amount, scale_date
FROM store_name;

-- 7. Add Sales Source Label
-- Combine both tables but include a new column 'source' that indicates whether the sale was made
-- Online or Store.
-- Output Columns: customer_name, amount, sale_date, source
SELECT 
    customer_name, 
    amount, 
    sale_date, 
    'Online' AS source
FROM online_sales

UNION ALL

SELECT 
    customer_name, 
    amount, 
    sale_date, 
    'Store' AS source
FROM store_sales;

-- 8. Customers Appearing in Both Tables
-- Find all customers who appear in both online_sales and store_sales (Hint: use UNION ALL,
-- GROUP BY, and HAVING).
-- Output Columns: customer_name, occurrences

SELECT customer_name, COUNT(*) AS Occurrences
FROM(SELECT  customer_name FROM online_sales
  UNION ALL
  SELECT customer_name
  FROM instore_sales) AS combined
GROUP BY customer_name
HAVING COUNT(*)>1;

-- 9. Total Combined Sales
-- Combine both tables using UNION ALL and calculate the total sales amount across both.
-- Output Columns: total_amount

SELECT SUM(amount)
AS total_amount
UNION ALL
SELECT SUM(amount) AS total_amount;

-- Bonus Challenge (Optional)
-- Create a single query that lists each customer’s total combined amount from both tables (sum of all
-- their purchases).
-- Output Columns: customer_name, total_spent
SELECT customer_name, SUM(amount) AS total_spent
UNION 
SELECT customer_name, SUM(amount) AS total_spent;
