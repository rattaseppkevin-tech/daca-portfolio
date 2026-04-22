SELECT 
    c.city, 
    COUNT(s.sale_id) AS tellimusi, 
    SUM(s.total_price) AS kogukäive, 
    AVG(s.total_price) AS keskmine_tellimus
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY kogukäive DESC;

SELECT 
    store_location, 
    COUNT(*) AS tellimuste_arv, 
    SUM(total_price) AS kogutulu
FROM sales
GROUP BY store_location
ORDER BY kogutulu DESC;

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nimi,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukäive
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.total_price) > 500
ORDER BY kogukäive DESC;

SELECT 
    COUNT(*) AS suurte_tehingute_arv
FROM sales
WHERE total_price > 1000;