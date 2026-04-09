SELECT 
    (COUNT(DISTINCT city) - COUNT(DISTINCT TRIM(UPPER(city)))) AS ebajarjekindlad_kirjaviisid
FROM customers;

-- Kirjuta SQL päring, mis näitab iga linna kohta: 
-- klientide arvu, puuduvate e-mailide arvu ja protsentuaalselt, 
-- kui suur osa klientidest on puuduva e-mailiga.
-- Kasuta customers tabelit ja grupeeri puhastatud linnanime järgi.
SELECT
    INITCAP(TRIM(city)) AS puhastatud_linn,
    COUNT(*) AS klientide_arv,
    COUNT(*) FILTER (WHERE email IS NULL) AS puuduvad_emailid,
    ROUND(COUNT(*) FILTER (WHERE email IS NULL) * 100.0 / COUNT(*), 2) AS puuduvate_protsent
FROM customers
GROUP BY puhastatud_linn
ORDER BY klientide_arv DESC;