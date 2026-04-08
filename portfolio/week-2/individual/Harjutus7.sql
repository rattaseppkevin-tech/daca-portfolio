    SELECT 'sales' AS tabel,
        COUNT(*) AS ridu_kokku,
        COUNT(DISTINCT sale_id) AS unikaalseid,
        COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate
    FROM sales
    UNION ALL
    SELECT 'customers',
        COUNT(*),
        COUNT(DISTINCT email),
        COUNT(*) - COUNT(DISTINCT email)
    FROM customers
    UNION ALL
    SELECT 'products',
        COUNT(*),
        COUNT(DISTINCT product_id),
        COUNT(*) - COUNT(DISTINCT product_id)
    FROM products;

SELECT 'sales' AS tabel,
    COUNT(*) AS read_kokku,
    COUNT(customer_id) AS unikaalsed,
    COUNT(*) - COUNT(customer_id) AS nullid
FROM sales
UNION ALL
SELECT 'customers',
    COUNT(*),
    COUNT(email),
    COUNT(*) - COUNT(email)
FROM customers
UNION ALL
SELECT 'products',
    COUNT(*),
    COUNT(supplier),
    COUNT(*) - COUNT(supplier)
FROM products;
    
