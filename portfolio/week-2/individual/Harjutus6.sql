SELECT
    product_id,
    product_name,
    retail_price,
    CAST(retail_price AS NUMERIC) AS kontroll_numeric,
    CASE
        WHEN retail_price IS NULL THEN 'NULL'
        WHEN retail_price <= 0 THEN 'VIGA'
        ELSE 'OK'
    END AS hinna_staatus
FROM products
ORDER BY retail_price ASC;