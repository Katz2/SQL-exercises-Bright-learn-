--https://app.snowflake.com/af-south-1.aws/ep63956/wKESGi7S0P#query
SELECT 
  transaction_date,
  product_category,
  transaction_qty,
  product_detail,
  COUNT (DISTINCT(transaction_id)) AS Number_of_Sales,--from the transaction are happening in a.
  unit_price,
  SUM(transaction_qty*unit_price) AS REVENUE,
  SUM(product_id) AS total_units,
  COUNT(DISTINCT (product_id)) AS order_count,
  -- EXTRACT(HOUR FROM CASE_STUDY.PUBLIC.CASE_) AS hour_of_day,
 
  HOUR(transaction_time) AS hour_time,
  store_location,
  product_type,
  
  CASE 
  WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN '01. Morning'
            WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN '02. Aftenoon'
            WHEN transaction_time BETWEEN '16:00:00' AND '19:59:59' THEN '03. Evening'
            WHEN transaction_time >= '20:00:00'  THEN '04. Night'
END AS time_bucket,

  DAYNAME(transaction_date) AS day_name,
  CASE 
  WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'WEEKEND'
  ELSE 'Weekday'
  END AS Week_DAY,
  
  MONTHNAME(transaction_date) AS month_in_year,
  DATEADD(--uses Interval arithmetic 
    minute,
    30 * FLOOR(EXTRACT(MINUTE FROM transaction_time) / 30),
    DATE_TRUNC('hour', transaction_time)
  ) AS transaction_time_bucket,


FROM CASE_STUDY.PUBLIC.CASE_
GROUP BY ALL;

