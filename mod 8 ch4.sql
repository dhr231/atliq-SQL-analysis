-- Create a stored proc that can determine the market badge based on the following logic.
-- If total sold quantity > 5 million that market ic considered Gold else it is Silver
-- My input will be.
-- market
-- fiscal year
-- Output
-- market badge

SELECT SUM(sold_quantity) as total_quantity
FROM fact_sales_monthly s
JOIN dim_customer c ON s.customer_code=c.customer_code
GROUP BY c.market;