    -- 1. Muudame kõik kuupäevad tekstina õigesse järjekorda (YYYY-MM-DD) AI ABIL
    UPDATE sales 
    SET sale_date = SUBSTRING(sale_date, 7, 4) || '-' || SUBSTRING(sale_date, 4, 2) || '-' || SUBSTRING(sale_date, 1, 2)
    WHERE sale_date LIKE '__/__/____';

    -- 2. Muudame tulba tüübi tekstist kuupäevaks AI ABIL
    ALTER TABLE sales ALTER COLUMN sale_date TYPE DATE USING sale_date::DATE;

    -- Müük kuude kaupa 2024. aastal AI ABIL
    SELECT
        TO_CHAR(sale_date, 'YYYY-MM') AS kuu,
        COUNT(*) AS tellimusi,
        SUM(total_price) AS käive,
        ROUND(AVG(total_price), 2) AS keskmine_tellimus
    FROM sales
    -- Kui sale_date on DATE tüüp, siis võrdlus käib nii:
    WHERE sale_date >= '2024-01-01'::DATE
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
    ORDER BY kuu;