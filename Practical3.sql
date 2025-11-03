-- 1. Find all records where Size is missing and the purchase_amount is greater than
-- 50.
-- Expected Columns: Customer ID, Size, purchase_amount, Item
-- Purchased

SELECT  customer_id, size, purchase_amount, item_purchased, 
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3,
WHERE size IS NULL AND
purchase_amount > 50 ;



--Q2
-- List the total number of purchases grouped by Season, treating NULL values a
-- s 'Unknown Season'.
-- Expected Columns: Season, Total Purchases
SELECT 
    COALESCE(season, 'Unknown Season') AS Season,
    SUM(purchase_amount) AS total_purchase
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY COALESCE(season, 'Unknown Season');

--Q3
-- Count how many customers used each Payment Method, treating NULLs as
-- 'Not Provided'.
-- Expected Columns: Payment Method, Customer Count
SELECT 
COUNT(DISTINCT(customer_id)) AS Customer_count,
COALESCE(payment_method, 'Not Provided') AS Payment 
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY COALESCE(payment_method, 'Not Provided') ;


--Q4
-- Show customers where Promo Code Used is NULL and Review Rating is below
-- 3.0.
-- Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased
SELECT 
customer_id, 
promo_code_used, 
review_rating,
ITEM_PURCHASED
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE promo_code_used IS NULL AND review_rating>3.0
;

--Q5
-- 5. Group customers by Shipping
-- Type, and return the average purchase_amount, treating missing values as 0.
-- Expected Columns: Shipping Type, Average purchase_amount
SELECT AVG(coalesce(purchase_amount, 0)) AS Purchase_amount, shipping_type

FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY shipping_type;



--Q6
-- 6. Display the number of purchases per Location only for those with more than
-- 5 purchases and no NULL Payment Method.
-- Expected Columns: Location, Total Purchases
SELECT location, purchase_amount

FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE payment_method IS NOT NULL AND
WHERE purchase_amount > 5;



SELECT 
    location,
    COUNT(*) AS total_purchases
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE payment_method IS NOT NULL
GROUP BY location
HAVING COUNT(*) > 5;


--Q7
-- 7. Create a column Spender Category that classifies customers using CASE:
-- 'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80,
-- 'Low' otherwise. Replace NULLs in purchase_amount with 0.
-- Expected Columns: Customer ID, purchase_amount, Spender Category
SELECT customer_id, coalesce(purchase_amount, 0),
CASE
WHEN purchase_amount>80 THEN 'High'
WHEN purchase_amount BETWEEN 50 AND 80 THEN 'Medium'
ELSE 'Low'
END AS Spender_Category
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3;



--Q8
-- 8. Find customers who have no Previous
-- Purchases value but whose Color is not NULL.
-- Expected Columns: Customer ID, Color, Previous Purchases
SELECT customer_id, color, previous_purchases
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE previous_purchases IS NULL AND
COLOR IS NOT NULL;

;



--Q9
-- 9. Group records by Frequency of
-- Purchases and show the total amount spent per group, treating NULL frequenc
-- ies as 'Unknown'.
-- Expected Columns: Frequency of Purchases, Total purchase_amount
SELECT 
SUM(purchase_amount) AS Total_spend,

COALESCE(frequency_of_purchases, 'Unknown') AS FREQUENCY_OF_PURCHASES
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY COALESCE(frequency_of_purchases, 'Unknown') ;


-- 10. Display a list of all Category values with the number of times each was purcha
-- sed, excluding rows where Categoryis NULL.
-- Expected Columns: Category, Total Purchases
SELECT  category, 
COUNT(previous_purchases) AS Total_Purchase,
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3

WHERE category IS NOT NULL 
GROUP BY category
;



-- 11. Return the top
-- 5 Locations with the highest total purchase_amount, replacing NULLs in amount
-- with 0.
-- Expected Columns: Location, Total purchase_amount
--Answer:
SELECT location,
COALESCE(purchase_amount, 0) AS Total_purchase_amount,
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3

LIMIT 5;


-- 12. Group customers by Gender and Size, and count how many entries have a NUL
-- L Color.
-- Expected Columns: Gender, Size, Null Color Count
--Answer:
SELECT 
COUNT(color) AS Null_Color_Count,
gender, size
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY gender, size;



-- 13. Identify all Item Purchased where more than 3 purchases had NULL Shipping
-- Type.
-- Expected Columns: Item Purchased, NULL Shipping Type Count
--Answer:
SELECT 
    item_purchased,
    COUNT(*) AS Null_shipping_type_count --ALL * AS placeholder
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE shipping_type IS NULL
GROUP BY item_purchased
HAVING COUNT(*) > 3;


-- 14. Show a count of how many customers per Payment Method have NULL Review
-- Rating.
-- Expected Columns: Payment Method, Missing Review Rating Count
--Answer:
SELECT 
    payment_method,
    COUNT(*) AS Missing_Rating_Count 
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE review_rating IS NULL
GROUP BY payment_method;


-- 15. Group by Category and return the average Review Rating, replacing NULLs with
-- 0, and filter only where average is greater than 3.5.
-- Expected Columns: Category, Average Review Rating
--Answer:
SELECT AVG(IFNULL(review_rating, 0) ) AS Average_Review_Rating,category,
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE review_rating>3.5
GROUP BY category;




-- 16. List all Colors that are missing (NULL) in at least
-- 2 rows and the average Age of customers for those rows.
-- Expected Columns: Color, Average Age
--Answer:
SELECT COLOR, 
AVG(age) AS Average_Age
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE color IS NULL 
GROUP BY COLOR
HAVING COUNT(*) >= 2
;



-- 17. Use CASE to create a column Delivery Speed: 'Fast' if Shipping Type is 'Express' or
-- 'Next Day Air', 'Slow' if 'Standard',
-- 'Other' for all else including NULL. Then count how many customers fall into
-- each category.
-- Expected Columns: Delivery Speed, Customer Count
--Answer:
SELECT 

CASE 
WHEN SHIPPING_TYPE = 'Express' THEN 'FAST'
WHEN SHIPPING_TYPE = 'Next Day Air' THEN 'SLOW'
ELSE 'Other'
END AS Delivery_Speed,
COUNT(*) AS Customer_Count
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY delivery_speed
;

-- 18. Find customers whose purchase_amount is NULL and whose Promo Code Used is
-- 'Yes'.
-- Expected Columns: Customer ID, purchase_amount, Promo Code Used
--Answer:
SELECT customer_id,
purchase_amount,
promo_code_used
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE purchase_amount IS NULL AND promo_code_used = 'yes';



-- 19. Group by Location and show the maximum Previous
-- Purchases, replacing NULLs with 0, only where the average rating is above 4.0.
-- Expected Columns: Location, Max Previous Purchases, Average
-- Review Rating
--Answer:
SELECT 
    location,
    MAX(COALESCE(previous_purchases, 0)) AS Max_Previous_Purchases,
    AVG(review_rating) AS Average_Review_Rating
FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
GROUP BY location
HAVING AVG(review_rating) > 4.0;


-- 20. Show customers who have a NULL Shipping
-- Type but made a purchase in the range of 30 to 70 USD.
-- Expected Columns: Customer ID, Shipping
-- Type, purchase_amount, Item Purchased
--Answer:

SELECT customer_id, shipping_type, purchase_amount, item_purchased


FROM PRACTICAL_3.PUBLIC.PRACTICAL_3
WHERE shipping_type IS NULL AND
purchase_amount BETWEEN 30 AND 70;
