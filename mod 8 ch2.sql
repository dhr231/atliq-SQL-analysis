SELECT CONCAT(MONTH(s.date)," ",YEAR(s.date)) AS sales_month, SUM(sold_quantity*gross_price) AS gross_sales FROM fact_sales_monthly s
JOIN fact_gross_price g ON s.product_code=g.product_code AND get_fiscal(s.date)=g.fiscal_year
WHERE customer_code=90002002
GROUP BY s.date
ORDER BY s.date ASC;