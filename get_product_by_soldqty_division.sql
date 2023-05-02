WITH CTE AS(
SELECT p.division,p.product,SUM(s.sold_quantity) AS total_qty FROM fact_sales_monthly s
JOIN dim_product p ON s.product_code=p.product_code
WHERE fiscal_year=2021
GROUP BY p.division,p.product
ORDER BY total_qty DESC
),
CTE2 AS(
SELECT *,dense_rank() OVER(PARTITION BY division ORDER BY total_qty DESC) AS drnk 
FROM CTE
)
SELECT * FROM CTE2
WHERE drnk<=5;
