-- 1. INNER JOIN: Orders with Customer and Product Names
-- Question:
-- List all orders along with the customer name and product name.
-- Expected Output Columns:
-- • OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT OrderID, OrderDate, CustomerName, ProductName, Quantity
FROM orders as s
INNER JOIN customer as C ON s.customerid  = c.customerid
INNER JOIN product_ as p ON s.productid = p.productid;



-- 2. INNER JOIN: Customers Who Placed Orders
-- Question:
-- Which customers have placed at least one order?
-- Expected Output Columns:
-- • CustomerID, CustomerName, Country, OrderID, OrderDate
SELECT OrderID, OrderDate, CustomerName, ProductName, Quantity
FROM orders as s
INNER JOIN customer as C ON s.customerid  = c.customerid
INNER JOIN product_ as p ON s.productid = p.productid

WHERE orderid >=1;


-- 3. LEFT JOIN: All Customers and Their Orders
-- Question:
-- List all customers and any orders they might have placed. Include customers who have
-- not placed any orders.
-- Expected Output Columns:
-- • CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT c.customerid, c.customername, c.country, s.orderid, p.productid, quantity
FROM orders as s
LEFT JOIN customer as c ON s.customerid  = c.customerid
LEFT JOIN product_ as p ON s.productid = p.productid;
---WHERE orderid>1;


-- 4. LEFT JOIN: Product Order Count
-- Question:
-- List all products and how many times each was ordered (if any).
-- Expected Output Columns:
-- • ProductID, ProductName, TotalOrders
-- (TotalOrders is the count of how many times the product appears in orders)
SELECT p.productid, p.productname, COUNT(s.productid)  AS TotalOrders 
FROM product_ AS p
LEFT JOIN orders AS s ON
p.productid = s.productid
GROUP BY p.productid, p.productname ;




-- 5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
-- Question:
-- been ordered.
-- Find all orders along with product details, including any products that might not have
-- Expected Output Columns:
-- • OrderID, OrderDate, ProductID, ProductName, Price, Quantity
--Answer:
SELECT o.orderid, o.orderdate, p.productid, p.productname, p.price, quantity
FROM order_ AS o
RIGHT JOIN product_ AS p 
ON o.productid =p.productid;



-- 6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
-- Question:
-- Which customers have made orders, and include customers even if they have never
-- placed an order.
-- Expected Output Columns:
-- • CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT c.customerid, c.customername, c.country, s.orderid, p.productid, quantity
FROM orders as s
RIGHT JOIN customer as c ON s.customerid  = c.customerid
RIGHT JOIN product_ as p ON s.productid = p.productid;


-- 7. FULL OUTER JOIN: All Customers and All Orders
-- Question:
-- List all customers and orders, showing NULLs where customers have not ordered or
-- where orders have no customer info.
-- Expected Output Columns:
-- • CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
--Answer 
--Answer:

SELECT c.customerid, c.customername, c.country, s.orderid, p.productid, quantity
FROM orders as s
FULL OUTER JOIN customer as c ON s.customerid  = c.customerid
FULL OUTER JOIN product_ as p ON s.productid = p.productid;



-- 8. FULL OUTER JOIN: All Products and Orders
-- Question:
-- List all products and orders, showing NULLs where products were never ordered or
-- orders are missing product info.
-- Expected Output Columns:
-- • ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity
SELECT p.productname, p.productname, p.price, s.orderid, s.orderdate, c.customerid, quantity
FROM orders as s
FULL OUTER JOIN customer as c ON s.customerid  = c.customerid
FULL OUTER JOIN product_ as p ON s.productid = p.productid;
