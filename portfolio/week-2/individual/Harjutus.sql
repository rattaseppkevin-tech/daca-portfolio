-- Leia duplikaatsed sale_id väärtused
SELECT
    sale_id,
    COUNT(*) AS koopiate_arv
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC
LIMIT 10;

-- Anna igale reale number oma grupi sees
SELECT
    sale_id,
    customer_id,
    total_price,
    sale_date,
    ROW_NUMBER() OVER (PARTITION BY sale_id ORDER BY sale_date) AS rn
FROM sales;

-- Duplikaatide mõju müüginumbritele
SELECT
    COUNT(*) AS ridu_kokku,
    COUNT(DISTINCT sale_id) AS unikaalsed,
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate,
    SUM(total_price) AS summa_duplikaatidega,
    (SELECT SUM(total_price) FROM (
        SELECT DISTINCT ON (sale_id) total_price
        FROM sales
        ORDER BY sale_id, sale_date
    ) unikaalsed) AS summa_ilma_duplikaatideta
FROM sales;

-- 
SELECT
    email,
    customer_id,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
FROM customers;

-- 
SELECT *
FROM (
    SELECT
        email,
        customer_id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
    FROM customers
) AS subquery
WHERE rn > 1;

SELECT *
FROM (
    SELECT
        email,
        first_name,
        last_name,
        customer_id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
    FROM customers
) AS subquery
WHERE email IN (
    SELECT email 
    FROM customers 
    GROUP BY email 
    HAVING COUNT(*) > 1
)
ORDER BY email;

