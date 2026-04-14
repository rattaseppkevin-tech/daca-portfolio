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


--Ühenda sales ja products tabelid et näha tootenimesid koos müügi kogustega.

SELECT
    p.product_name,
    p.category,
    s.quantity,
    s.unit_price
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
ORDER BY s.quantity DESC
LIMIT 15;


SELECT
    p.product_name,
    p.category,
    s.store_location,
    s.unit_price,
    s.sale_date
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
ORDER BY s.total_price DESC
LIMIT 20;