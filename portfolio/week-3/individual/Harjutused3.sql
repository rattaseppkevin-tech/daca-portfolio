SELECT
    p.product_name,
    p.category,
    p.cost_price,    -- See on summa, millega me toote sisse ostsime (seotud raha)
    p.retail_price,  -- See on summa, millega me lootsime seda müüa
    s.store_location
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL
ORDER BY p.cost_price DESC;


SELECT
    c.city,                             -- Näitame linna nime
    COUNT(c.customer_id) AS kadunud_kliendid -- Loeme kokku kliendid selles linnas
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL                 -- Ainult need, kellel pole müüke
GROUP BY c.city                         -- Grupeerime linnade kaupa
ORDER BY kadunud_kliendid DESC;