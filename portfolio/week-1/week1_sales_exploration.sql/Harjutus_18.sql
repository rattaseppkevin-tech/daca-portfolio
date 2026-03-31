SELECT 
    COUNT(*) AS toodete_koguarv,
    COUNT(DISTINCT category) AS unikaalseid,
    COUNT(*) - COUNT(DISTINCT cost_price) AS puuduvad_hinnad
FROM products;