SELECT 
    COUNT(*) AS kokku, 
    COUNT(DISTINCT sale_id) AS unikaalseid,
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaatseid
FROM sales;