WITH CTE1 AS(
SELECT c.market,c.region,ROUND(SUM(s.sold_quantity*g.gross_price)/1000000,2) AS gross_sales_mln 
FROM fact_sales_monthly s
JOIN dim_customer c ON c.customer_code=s.customer_code
JOIN fact_gross_price g ON s.product_code=g.product_code
WHERE s.fiscal_year=2021
GROUP BY c.market,c.region
),
CTE2 AS(
SELECT*,DENSE_RANK() OVER(PARTITION BY region ORDER BY gross_sales_mln DESC) AS drnk
FROM CTE1
)

SELECT * FROM CTE2
WHERE drnk<=2;

