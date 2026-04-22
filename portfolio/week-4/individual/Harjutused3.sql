SELECT
    p.category, 
    COUNT(DISTINCT s.product_id) AS unikaalne_toodete_arv,
    AVG(s.total_price) AS keskmine_tehing,
    SUM(s.quantity) AS müüdud_kogus
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
HAVING SUM(s.quantity) > 10;


SELECT 
    'Jaanuar 2024' AS periood,
    SUM(total_price) AS käive
FROM sales
WHERE sale_date >= '2024-01-01' AND sale_date <= '2024-01-31'
GROUP BY periood 
HAVING SUM(total_price) > 5000;

WITH kuu_myyk AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS käive
    FROM sales
    WHERE sale_date >= '2024-01-01'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    käive,
    LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu,
    käive - LAG(käive) OVER (ORDER BY kuu) AS kasv
FROM kuu_myyk
ORDER BY kuu;

WITH kliendiinfo AS (
    SELECT customer_id, first_name || ' ' || last_name AS nimi, city
    FROM customers
),
kliendi_tellimused AS (
    SELECT
        customer_id,
        COUNT(sale_id) AS tellimusi,
        SUM(total_price) AS kogukäive
    FROM sales
    GROUP BY customer_id
)
SELECT
    k.nimi, k.city,
    kt.tellimusi, kt.kogukäive,
    CASE
        WHEN kt.kogukäive > 1000 THEN 'VIP'
        WHEN kt.kogukäive > 500 THEN 'Aktiivne'
        ELSE 'Tavaline'
    END AS segment
FROM kliendiinfo k
JOIN kliendi_tellimused kt ON k.customer_id = kt.customer_id
ORDER BY kt.kogukäive DESC;
