SELECT
    c.first_name,
    c.last_name,
    c.city,
    s.sale_id,
    s.total_price
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_price DESC NULLS LAST;

-- Kliendid, kes pole KUNAGI ostnud
SELECT
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.registration_date
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

-- Kadunud kliendid: LEFT JOIN + WHERE IS NULL
SELECT
    c.first_name || ' ' || c.last_name AS nimi,
    c.email,
    c.city,
    c.registration_date
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
ORDER BY c.registration_date DESC;

-- Võrdluseks: INNER JOIN (ainult aktiivsed kliendid) 9130
SELECT COUNT(DISTINCT c.customer_id) AS aktiivseid_kliente
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id;

SELECT COUNT(DISTINCT c.customer_id) AS passiivseid_kliente
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;