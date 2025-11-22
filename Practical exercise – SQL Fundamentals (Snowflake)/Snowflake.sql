Data Preparation
Before analysis, the raw dataset was thoroughly cleaned to ensure accuracy and reliability.
Key data preparation steps included:
Removing duplicates to avoid inflated counts and inaccurate insights
Handling NULL values using imputation or filtering depending on the context
Standardizing formats such as dates, product names, and category labels
Correcting inconsistencies (e.g., mismatched category names or spelling variations)
Filtering out unusable or corrupted records to improve data quality
This step ensured the dataset was clean, consistent, and analysis-ready.

Normalization
Dataset values were normalized to maintain consistency and improve query performance.
This included:
Standardizing column names
Ensuring consistent units (e.g., currency, quantities)
Aligning categorical variables to a unified naming convention
Normalization improved the clarity and usability of the dataset across SQL queries and visualizations.

Data Querying (Snowflake)
All analytical queries were run in Snowflake, including:
Filtering and extracting key metrics
Aggregations (SUM, AVG, COUNT, GROUP BY)
CASE logic to categorize customers and transactions
Joining tables for deeper insights
Preparing data for BI dashboards
