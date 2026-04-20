SELECT *
FROM sales
LIMIT 5;

SELECT sale_date, total_price
FROM sales;

SELECT
    DATE_TRUNC('month', sale_date) AS kuu,
    SUM(total_price) AS kaive
FROM sales
WHERE sale_date >= '2024-01-01'
GROUP BY DATE_TRUNC('month', sale_date)
    HAVING SUM(total_price) >= 150000
ORDER BY kaive DESC;


SELECT COUNT(*) FROM products;
SELECT * FROM products limit 1;

SELECT category, COUNT(*) AS artikled
FROM products
GROUP BY category;

-- Anna kliendi nimi ja tema kogukäive

SELECT c.first_name, c.last_name, SUM(total_price) AS kliendikäive
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.first_name, c.last_name;

SELECT city, COUNT(*) AS arv
FROM sales s
JOIN customers c ON c.customer_id = s.customer_id
WHERE sale_date >= '2024-01-01'
GROUP BY city
HAVING COUNT(*) > 200
ORDER BY arv DESC;

SELECT periood, kaive, 
    LAG(kaive) OVER (ORDER BY periood) AS eelminekuu
FROM 
    (SELECT
        DATE_TRUNC('month', sale_date) AS periood,
        SUM(total_price) AS kaive
    FROM sales
    GROUP BY DATE_TRUNC('month', sale_date)
    ) AS kuumuuk
ORDER BY periood;

-- Sama päring CTE süntaksiga

WITH
    kuumuuk AS (
        SELECT
            TO_CHAR(sale_date, 'YYYY-MM') AS periood,
            SUM(total_price) AS kaive
        FROM sales
        GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
    )
SELECT
    periood,
    kaive,
    LAG(kaive) OVER (ORDER BY periood) AS eelminekuu
FROM kuumuuk
ORDER BY periood;