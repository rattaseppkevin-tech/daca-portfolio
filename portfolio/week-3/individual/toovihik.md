# Nädal 3 SQL JOINs


## 1.3 Concrete Practice: INNER JOIN harjutused

### Harjutus 1A: Shu — järgi malli

* **Ülesanne: Kopeeri järgmine päring Supabase SQL Editorisse ja käivita see**

    ```sql
    -- INNER JOIN: kliendid koos nende müükidega
    SELECT
        c.first_name,
        c.last_name,
        c.city,
        s.sale_id,
        s.sale_date,
        s.total_price
    FROM sales s
    INNER JOIN customers c ON s.customer_id = c.customer_id
    ORDER BY s.total_price DESC
    LIMIT 20;
    ```
     * Mitu rida tulemus näitab?
        > 20
     * Milline klient on kõige suurema tellimusega?
        > Madis Roots summaga 2170.40
     * Millisest linnast on enim kliente TOP 20-s?
        > Tallinn
     * Proovi nüüd eemaldada LIMIT 20. Mitu rida kokku tuleb?
        > 13747

### Harjutus 1B: Ha — rakenda uues kontekstis

* **Ülesanne: Kirjuta ise päring, mis ühendab sales ja products tabelid, et näha tootenimesid koos müüdud kogustega.**

