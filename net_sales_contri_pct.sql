WITH CTE AS
(
SELECT c.customer,ROUND(SUM(n.net_sales)/1000000,2) AS Net_Sales_mln 
    FROM gdb041.net_sales_table n
    JOIN gdb041.dim_customer c ON c.customer_code=n.customer_code
    WHERE n.fiscal_year=2021
    GROUP BY c.customer
    ORDER BY Net_Sales_mln DESC
)

SELECT *,Net_Sales_mln*100/SUM(Net_Sales_mln) OVER() AS net_sales_pct FROM CTE