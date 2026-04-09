-- Orbid müügid — kas on customer_id, mida pole customers tabelis?
SELECT COUNT(*) AS orb_klient
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL AND s.customer_id IS NOT NULL;

-- Orbid müügid — kas on product_id, mida pole products tabelis?
SELECT COUNT(*) AS orb_toode
FROM sales s
LEFT JOIN products p ON s.product_id = p.product_id
WHERE p.product_id IS NULL AND s.product_id IS NOT NULL;

-- Kontrolli hindade kooskõla — kas müügihind ja tootehind klapivad?
SELECT 
    s.sale_id, 
    s.total_price, 
    p.retail_price AS tootehind, 
    s.quantity,
    s.total_price - (p.retail_price * s.quantity) AS erinevus
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE ABS(s.total_price - (p.retail_price * s.quantity)) > 1
ORDER BY ABS(s.total_price - (p.retail_price * s.quantity)) DESC -- Kasutame valemit, mitte nime
LIMIT 20;

-- Kontrollime, kas 810 on hoopis ostudeta klientide arv
SELECT COUNT(*) 
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

 -- Kontrolli, kas on kliente, kes pole kunagi ostnud:
SELECT COUNT(*) AS vaimkliendid
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL;


-- Arvutan kokku kõik tooted mida pole kunagi ostetud.
SELECT COUNT(*) AS vaimtooted
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.product_id IS NULL;


-- Millistel tootel on suurimad hinnaerinevused?
SELECT 
    p.product_name, 
    p.category, 
    p.retail_price AS list_hind,
    AVG(s.total_price / NULLIF(s.quantity, 0)) AS kesk_muugihind,
    p.retail_price - AVG(s.total_price / NULLIF(s.quantity, 0)) AS erinevus
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category, p.retail_price
-- HAVING osas peame valemi uuesti kirjutama
HAVING ABS(p.retail_price - AVG(s.total_price / NULLIF(s.quantity, 0))) > 5
-- ORDER BY osas võime kasutada tulba järjekorranumbrit (5. tulp on erinevus)
ORDER BY ABS(5) DESC
LIMIT 10;