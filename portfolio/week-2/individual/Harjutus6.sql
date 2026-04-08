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

SELECT
    sale_id,
    sale_date,
    -- TO_DATE ütleb andmebaasile: "Esimene on päev (DD), siis kuu (MM)"
    TO_CHAR(TO_DATE(sale_date, 'DD/MM/YYYY'), 'DD.MM.YYYY') AS eesti_kuupaev,
    TO_CHAR(TO_DATE(sale_date, 'DD/MM/YYYY'), 'TMDay') AS nadalapaev,
    TO_CHAR(TO_DATE(sale_date, 'DD/MM/YYYY'), 'YYYY-"Q"Q') AS kvartal,
    EXTRACT(DOW FROM TO_DATE(sale_date, 'DD/MM/YYYY')) AS paev_nr
FROM sales
-- Sorteerime samuti kuupäevaks muudetud väärtuse järgi
ORDER BY TO_DATE(sale_date, 'DD/MM/YYYY') DESC
LIMIT 10;