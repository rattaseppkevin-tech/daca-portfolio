SELECT
    p.product_name,
    p.category,
    p.subcategory,
    p.retail_price,
    p.cost_price,
    s.sale_id
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;


SELECT COUNT(*) AS müümata_tooted
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;

SELECT
    p.product_name,
    p.category,
    p.subcategory,
COUNT(s.sale_id) AS müüdud_kordi,
SUM(s.total_price) AS kogumüük
FROM products p
INNER jOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category, p.subcategory
ORDER BY kogumüük DESC
LIMIT 10;

SELECT
    p.category,
COUNT(DISTINCT p.product_id) AS tooteid,
COUNT(s.sale_id) AS müüke,
SUM(s.total_price) AS kogumüük
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY kogumüük DESC;


SELECT
    p.product_name,
    p.category,
    i.location,
    i.quantity_available,
    i.reorder_point,
    CASE
        WHEN i.quantity_available <= i.reorder_point THEN 'TELLI JUURDE'
        ELSE 'OK'
    END AS staatus
FROM products p
LEFT JOIN inventory i ON p.product_id = i.product_id
ORDER BY i.quantity_available ASC;

--lisa1
SELECT 
    p.product_name, 
    p.category, 
    p.cost_price, 
    p.retail_price, 
    COALESCE(i.quantity_available, 0) AS laoseis, 
    (p.cost_price * COALESCE(i.quantity_available, 0)) AS kinni_olev_kapital,
    (p.retail_price * COALESCE(i.quantity_available, 0)) AS saamata_jaanud_tulu
FROM products p 
LEFT JOIN sales s ON p.product_id = s.product_id 
LEFT JOIN inventory i ON p.product_id = i.product_id 
WHERE s.sale_id IS NULL                 -- Leiab need 12 müümata toodet
ORDER BY kinni_olev_kapital DESC;


--lisa2
SELECT 
    p.product_name, 
    p.category, 
    i.quantity_available
FROM products p 
LEFT JOIN sales s ON p.product_id = s.product_id 
LEFT JOIN inventory i ON p.product_id = i.product_id 
WHERE s.sale_id IS NULL;
