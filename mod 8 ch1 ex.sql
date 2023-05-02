SELECT * FROM fact_sales_monthly
WHERE customer_code=90002002 AND get_fiscal(date)=2021 AND get_fiscal_quarter(date)="Q4"
ORDER BY date ASC;