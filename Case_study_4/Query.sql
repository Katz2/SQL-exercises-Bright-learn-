
SELECT
  
    make,
    model,
    body,
    transmission,
    color,
    trim,
    interior,
    condition,
    state,

    COUNT(*) AS total_cars_sold,
    SUM(sellingprice) AS total_revenue,
    AVG(sellingprice) AS avg_selling_price,
    MIN(sellingprice) AS min_price,
    MAX(sellingprice) AS max_price

FROM BRIGHT_CAR_SALES.PUBLIC.BRIGHT

WHERE make IS NOT NULL 


GROUP BY 
    
    make, model, body, transmission, color,
    trim, interior, condition, state

ORDER BY  total_revenue DESC;
