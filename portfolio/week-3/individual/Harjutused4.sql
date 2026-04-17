-- 3 tabeli JOIN: kes ostis mida?
SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    s.sale_date AS müügi_kuupäev,
    p.product_name AS toode,
    p.category AS kategooria,
    s.quantity AS kogus,
    s.unit_price AS ühikuhind,
    s.total_price AS rea_summa
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
ORDER BY rea_summa DESC
LIMIT 20;

SELECT
    p.category,
    c.city,
    sum(s.total_price) AS kogumüük
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY c.city, p.category
ORDER BY kogumüük DESC;

