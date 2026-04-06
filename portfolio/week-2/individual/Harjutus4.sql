SELECT
    customer_id,
    COALESCE(first_name, 'Tundmatu') AS eesnimi,
    COALESCE(last_name, 'Puuduv') AS perekonnanimi,
    COALESCE(email, 'puudub@urbanstyle.ee') AS email,
    COALESCE(phone, 'numberpuudu') AS telefon
FROM customers
WHERE first_name IS NULL 
   OR last_name IS NULL 
   OR email IS NULL 
   OR phone IS NULL;

SELECT COUNT(*) AS vajab_asendust
FROM customers
WHERE first_name IS NULL 
   OR last_name IS NULL 
   OR email IS NULL 
   OR phone IS NULL;

-- Võrdlus: SUM kõigist vs SUM mitte-NULL väärtustest
SELECT
    COUNT(*) AS ridu,
    COUNT(total_price) AS summa_olemas,
    COUNT(*) - COUNT(total_price) AS summa_puudub,
    SUM(total_price) AS kogusumma,
    AVG(total_price) AS keskmine
FROM sales;