SELECT 
    c.city, 
    COUNT(s.sale_id) AS tellimusi, 
    SUM(s.total_price) AS kogukäive, 
    AVG(s.total_price) AS keskmine_tellimus
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY kogukäive DESC;