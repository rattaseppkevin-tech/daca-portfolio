-- Mitu rida on sales tabelis? 

SELECT COUNT(*) AS ridade_arv
FROM sales;

-- Millised veerud ja andmed tabelis on?

SELECT *
FROM sales
LIMIT 10;

-- Tallinna kaupluse müügid

 SELECT *
 FROM sales
 WHERE store_location = 'Tallinn'
 ORDER BY sale_date desc
 LIMIT 15;

-- 10 suurimat tehingut

SELECT *
FROM sales
ORDER BY total_price DESC
LIMIT 10;

-- 10 väikseimat tehingut

SELECT *
FROM sales
ORDER BY total_price ASC
LIMIT 10;

-- Mitu rida, kus kliendi info on puudu?

 SELECT
    COUNT(*),
    COUNT(customer_id),
    COUNT(*) - COUNT(customer_id) AS puuduv_klient
FROM sales;

-- Leia kõik unikaalsed müügikanalid, mis müügitabelis esinevad:

SELECT DISTINCT channel FROM sales;

-- Loe kokku tehingute arv iga kaupluse kohta:

SELECT store_location, COUNT(*) AS tehingud
FROM sales
GROUP BY store_location
ORDER BY tehingud DESC;

-- Leia tehingud, kus summa on üle 100 EUR JA kauplus on Tallinnas:

SELECT *
FROM sales
WHERE total_price > 100 AND store_location = 'Tallinn'
ORDER BY total_price DESC;