SELECT *
FROM sales
WHERE total_price <= 0 OR customer_id IS NULL