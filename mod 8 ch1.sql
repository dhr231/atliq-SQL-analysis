-- As a product owner. I want to generate a report of individual product sales (aggregated on a monthly
-- basis at the prodtKt code level) for Croma India customer for FY -2021 that I can track individual
-- prcxiuct sales and nn further product analytics on it in excel
-- The should following fields.
-- 1. Month
-- 2. Product Name
-- 3. Vanant
-- 4. Sold Quantity
-- 5. Gross Price Per item
-- 6. Gross Price Total

SELECT CONCAT(MONTHNAME(date)," ",YEAR(date)) as month, product, variant, sold_quantity,gross_price,(gross_price*sold_quantity) as gross_total FROM fact_sales_monthly 
JOIN dim_customer USING(customer_code)
JOIN dim_product USING(product_code)
JOIN fact_gross_price USING(product_code)
WHERE customer_code="90002002" AND market="India"  AND get_fiscal(date)=2021
ORDER BY date ASC;
