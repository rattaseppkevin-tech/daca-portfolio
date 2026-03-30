SELECT DISTINCT channel AS väärtus FROM sales
UNION
SELECT DISTINCT payment_method FROM sales;