SELECT COUNT (*)
FROM sales
WHERE total_price > 200 AND sale_date LIKE '%2024%' and payment_method = 'kaart';