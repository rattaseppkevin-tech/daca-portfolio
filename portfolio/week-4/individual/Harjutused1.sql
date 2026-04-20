
    -- Müük kuude kaupa 2024. aastal AI ABIL
    SELECT
        TO_CHAR(sale_date, 'YYYY-MM') AS kuu,
        COUNT(*) AS tellimusi,
        SUM(total_price) AS käive,
        ROUND(AVG(total_price), 2) AS keskmine_tellimus
    FROM sales
    WHERE sale_date >= '2024-01-01'
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
    ORDER BY kuu;