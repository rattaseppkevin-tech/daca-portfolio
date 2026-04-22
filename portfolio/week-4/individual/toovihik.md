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

    ```sql
    SELECT 
        store_location, 
        COUNT(*) AS tellimuste_arv, 
        SUM(total_price) AS kogutulu
    FROM sales
    GROUP BY store_location
    ORDER BY kogutulu DESC;
    ```

    * **Kontrolltabel:**

        - [x] Minu päring kasutab GROUP BY-d
        - [x] Minu päring kasutab vähemalt ühte agregaatfunktsiooni
        - [x] Ma oskan seletada, mida tulemus äriliselt tähendab

---

## 2.3 Concrete Practice: HAVING harjutused

### Harjutus 2A: Shu — järgi malli

* **Ülesanne: Kopeeri ja käivita — leia kliendid, kes on ostnud üle 500€:**

    ```sql
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        COUNT(s.sale_id) AS tellimuste_arv,
        SUM(s.total_price) AS kogukäive
    FROM customers c
    JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
    HAVING SUM(s.total_price) > 500
    ORDER BY kogukäive DESC;
    ```

    * Mitu klienti ületas 500€ piiri? **1675**

    * Kes on TOP 3 klienti? **Tiina Pärn, Priit Rand ja Kevin Org.**

    * Kui muudad piiri 1000€ peale, mitu jääb? **283.**

### Harjutus 2B: Ha — Liisi varude audit

* **Ülesanne: Liis Koppel helistas, sest Tartu poe varudes on erinevused. Kirjuta päring, mis leiab tooted, kus kategoorias on müüdud üle vali ise piir ühiku.**

    ```sql
    SELECT
        p.category, 
        COUNT(DISTINCT s.product_id) AS unikaalne_toodete_arv,
        AVG(s.total_price) AS keskmine_tehing,
        SUM(s.quantity) AS müüdud_kogus
    FROM sales s
    INNER JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category
    HAVING SUM(s.quantity) > 10;
    ```

    * Milline kategooria müüb kõige rohkem ühikuid? **Meeste riided.**

    * Milline on kõige kõrgema keskmise hinnaga kategooria? **Jalanõud.**

    * Kas kallim kategooria müüb ka rohkem? Miks / miks mitte?  **Ei, kuna jalanõud on reeglina kallimad kui näiteks tavariided**

### Harjutus 2C: Rakendus — WHERE + HAVING koos

* **Ülesanne: Kirjuta päring, mis kasutab NII WHERE-d KUI KA HAVING-ut koos. Mõtle äriküsimusele, kus sul on vaja filtreerida nii üksikuid ridu kui ka gruppe.**

    ```sql
    SELECT 
        'Jaanuar 2024' AS periood,
        SUM(total_price) AS käive
    FROM sales
    WHERE sale_date >= '2024-01-01' AND sale_date <= '2024-01-31'
    GROUP BY periood 
    HAVING SUM(total_price) > 5000;
    ```

    * **Kontrolltabel:**

     - [x] Minu päring kasutab WHERE-d (rea-taseme filter)
     - [x] Minu päring kasutab HAVING-ut (grupi-taseme filter)
     - [x] Ma oskan seletada, miks WHERE on enne GROUP BY-d ja HAVING pärast

---

## 3.3 Concrete Practice: CTE ja Window Functions harjutused

### Harjutus 3A: Shu — CTE mall

* **Ülesanne: Kopeeri ja käivita järgmine CTE päring, mis arvutab kuu käive ja kasvu:**

    ```sql
    WITH kuu_myyk AS (
        SELECT
            DATE_TRUNC('month', sale_date) AS kuu,
            SUM(total_price) AS käive
        FROM sales
        WHERE sale_date >= '2024-01-01'
        GROUP BY DATE_TRUNC('month', sale_date)
    )
    SELECT
        kuu,
        käive,
        LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu,
        käive - LAG(käive) OVER (ORDER BY kuu) AS kasv,
        ROUND(
            100.0 * (käive - LAG(käive) OVER (ORDER BY kuu))
            / LAG(käive) OVER (ORDER BY kuu), 1
        ) AS kasv_protsent
    FROM kuu_myyk
    ORDER BY kuu;
    ```

    * Milline kuu näitas suurimat kasvu protsentides? **2026 Juuni tulevikus.**

    * Milline kuu näitas langust?  **Suurim langus on 2025 detsember -95%.**

    * Miks on esimese kuu kasv NULL? **Kuna LAG funktsioonil pole midagi panna sinna**
    
### Harjutus 3B: Ha — kliendianalüüs CTE-ga

* **Ülesanne: Kirjuta ise CTE-põhine päring, mis segmenteerib kliendid VIP / Aktiivne / Tavaline tasemetesse.**

### Harjutus 3C: Rakendus — Window Function

* **Ülesanne: Kasuta ROW_NUMBER() funktsiooni, et leida iga kategooria TOP 3 toodet müüdud koguse järgi.**

---