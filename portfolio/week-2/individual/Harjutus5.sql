-- Kuupäevade formateerimine UrbanStyle'i andmetes
SET datestyle = 'ISO, DMY'; -- Ütleme, et päeva-kuu järjekord on okei

SELECT
    sale_id,
    sale_date,
    TO_CHAR(sale_date::DATE, 'DD.MM.YYYY') AS eesti_kuupaev,
    TO_CHAR(sale_date::DATE, 'FMDay') AS nadalapaev,
    TO_CHAR(sale_date::DATE, 'YYYY-"Q"Q') AS kvartal,
    EXTRACT(DOW FROM sale_date::DATE) AS paev_nr
FROM sales
ORDER BY sale_date::DATE DESC -- Sorteerime ka kuupäevana, mitte tekstina!
LIMIT 10;


-- Linnade ühtlustamise diagnostika
SELECT
    city AS originaal,
    TRIM(city) AS trimitud,
    INITCAP(TRIM(city)) AS puhastatud,
    COUNT(*) AS kliente
FROM customers
GROUP BY city
ORDER BY city;


SELECT 
    INITCAP(TRIM(city)) AS puhastatud_linn,
    COUNT(*) AS kliente_kokku,
    COUNT(DISTINCT city) AS erinevaid_kirjaviise
FROM customers
GROUP BY INITCAP(TRIM(city))
ORDER BY kliente_kokku DESC;
