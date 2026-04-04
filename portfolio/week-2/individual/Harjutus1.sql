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


SELECT
    phone,
    COUNT(*) AS koopiad
FROM customers
GROUP BY phone
HAVING COUNT(*) > 1
ORDER BY koopiad DESC;

SELECT SUM(koopiad) AS duplikaatide_koguarv
FROM (
    SELECT
        phone,
        COUNT(*) AS koopiad
    FROM customers
    GROUP BY phone
    HAVING COUNT(*) > 1
) AS alam_paring;