SELECT
    p.category,
    c.city,
    SUM(p.retail_price - p.cost_price) AS kogukasum
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY c.city, p.category
ORDER BY kogukasum DESC;

SELECT 
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    p.category AS kategooria,
    MAX(p.retail_price) AS kalleim_toode_tellimuses,
    COUNT(p.product_id) AS tooteid_tellimuses
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY 
    s.sale_id, c.first_name, c.last_name, c.city, p.category
ORDER BY 
    kalleim_toode_tellimuses DESC; -- See vastab esimesele küsimusele