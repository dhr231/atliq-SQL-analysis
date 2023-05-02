#EXPLAIN ANALYZE
#creating pre_invoice_discount_table and then view
WITH net_invoice_sales_table AS
(
SELECT s.date,s.customer_code,s.product_code,pr.pre_invoice_discount_pct,ROUND((s.sold_quantity*g.gross_price),2) AS gross_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g 
ON s.product_code=g.product_code AND s.fiscal_year=g.fiscal_year
JOIN fact_pre_invoice_deductions pr
ON s.customer_code=pr.customer_code AND pr.fiscal_year=s.fiscal_year
-- WHERE s.customer_code=90002002 AND s.fiscal_year=2021
#GROUP BY s.date,s.customer_code
)

#creating net_invoice_sales_table and then view
SELECT *,ROUND((gross_sales-pre_invoice_discount_pct*gross_sales),2) AS net_invoice_sales
FROM pre_invoice_deduction_table;

#creating net_sales_table and then view
SELECT n.*,(n.net_invoice_sales-(post.discounts_pct+post.other_deductions_pct)*n.net_invoice_sales) AS net_sales
FROM net_invoice_sales_table n
JOIN fact_post_invoice_deductions post USING(fiscal_year,customer_code,product_code);

