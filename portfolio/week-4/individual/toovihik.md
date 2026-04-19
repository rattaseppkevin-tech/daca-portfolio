# Nädal 4 SQL Agregatsioon.

---

## 1.3 Concrete Practice: GROUP BY harjutused

### Harjutus 1A: Shu — järgi malli

* **Ülesanne: Kopeeri järgmine päring Supabase SQL Editorisse ja käivita see.**

    ```sql
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
    ```
    
    * Milline kuu oli kõige kasumlikum? 
        > Detsember aasta 2024, 550 tellimust ja 170623 eurot käive.
    * Milline kuu oli kõige madalam?
        > Mai aasta 2026, 1 tellimus käive 77.60 eurot
    * Kas märkad trendi (kasv/langus)?
        > 2025 lõpp hakkasid tellimused langema ja 2026 on need juba olematud.

### Harjutus 1B: Ha — rakenda uues kontekstis

* **Ülesanne: Kirjuta ise päring, mis näitab müüki linnade kaupa.**

    ```sql
    SELECT 
        c.city, 
        COUNT(s.sale_id) AS tellimusi, 
        SUM(s.total_price) AS kogukäive, 
        AVG(s.total_price) AS keskmine_tellimus
    FROM customers c
    INNER JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.city
    ORDER BY kogukäive DESC;
    ```

    * Millises linnas on kõige suurem kogukäive?
        > Tallinn.
    * Kas linn, kus on enim tellimusi, on ka kõige suurema käibega? 
        > Jah.
    * Mis võiks seda erinevust seletada?
        > Puhas loogika Tallinnas on 50% Eesti populatsioonist. Rohkem rahvast linna = rohkem käivet poodidele reeglina.

### Harjutus 1C: Rakendus — oma analüüs

* **Ülesanne: Mõtle äriküsimusele, millele GROUP BY aitab vastata. Kirjuta päring ja analüüsi tulemust.**