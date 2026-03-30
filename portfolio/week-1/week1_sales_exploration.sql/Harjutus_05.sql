SELECT customer_id, sale_date, total_price AS summa
FROM sales
ORDER BY sale_date DESC
LIMIT 20;