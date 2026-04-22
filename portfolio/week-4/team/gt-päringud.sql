-- 1. Esimene korrus: arvutame baasandmed
WITH algandmed AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        COUNT(o.sale_id) AS tellimuste_arv,
        SUM(o.total_price) AS kogukäive
    FROM customers c
    JOIN sales o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
), 
-- 2. Teine korrus: lisame segmendid (Märka, et siin pole enam sõna WITH, vaid on KOMA)
kliendi_segmendid AS (
    SELECT 
        *, 
        CASE 
            WHEN kogukäive > 1500 THEN 'VIP'
            WHEN kogukäive > 500 THEN 'Regular'
            ELSE 'Uus' 
        END AS segment
    FROM algandmed
)

SELECT 
    segment, 
    COUNT(*) AS klientide_arv,                      -- Mitu klienti igas segmendis?
    ROUND(AVG(kogukäive), 2) AS keskmine_kaive,      -- Mis on keskmine käive?
    STRING_AGG(DISTINCT city, ', ') AS linnad        -- Kus nad asuvad? (Boonus)
FROM kliendi_segmendid
GROUP BY segment
ORDER BY keskmine_kaive DESC;