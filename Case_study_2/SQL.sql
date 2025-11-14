

SELECT
    date,
    sales,
    quantity_sold,
    ---Daily Sales Price per Unit
    ROUND(sales/ NULLIF(quantity_sold, 0), 2) AS daily_sales_price_per_unit,

    -- Average Unit Sales Price (over all records)
    ROUND(AVG(sales / NULLIF(quantity_sold, 0)) OVER (), 2) AS avg_unit_sales_price,

    -- Daily % Gross Profit
    ROUND(((sales - cost_of_sales) / NULLIF(sales, 0)) * 100, 2) AS daily_gross_profit_pct,

    --Daily % Gross Profit per Unit
    ROUND(
        (
            ((sales - cost_of_sales) / NULLIF(quantity_sold, 0)) /
            NULLIF((sales / NULLIF(quantity_sold, 0)), 0)
        ) * 100,
        2
    ) AS daily_gross_profit_pct_per_unit

FROM SALES.PUBLIC.SALES
ORDER BY date ASC;
