WITH year_sales AS
(SELECT get_fiscal(s.date) AS fic_year, SUM(s.sold_quantity*g.gross_price) AS gross_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g 
ON s.product_code=g.product_code AND get_fiscal(s.date)=g.fiscal_year
WHERE customer_code=90002002
)

SELECT * FROM year_sales y
GROUP BY fic_year;
