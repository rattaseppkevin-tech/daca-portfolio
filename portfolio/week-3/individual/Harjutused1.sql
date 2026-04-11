-- INNER JOIN: kliendid koos nende müükidega
SELECT
    c.first_name,
    c.last_name,
    c.city,
    s.sale_id,
    s.sale_date,
    s.total_price
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_price DESC
LIMIT 20;