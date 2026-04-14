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

   ```sql
   SELECT
      p.product_name,
      p.category,
      s.quantity,
      s.unit_price
   FROM sales s
   INNER JOIN products p ON s.product_id = p.product_id
   ORDER BY s.quantity DESC
   LIMIT 15;
   ```

      * Milline toode on kõige rohkem müüdud?
         > Kõik 15 toodet mis päringus tulid on võrdselt müüdud.
      * Kas kalleim toode on ka enim müüdud?
         > Ei ole.
      * Mida see ütleb UrbanStyle'i klientide eelistuste kohta?
         > Hetkeline päring näitab, et meeste riided on enim ostetud ca 50% koguest.

### Harjutus 1C: Rakendus — oma päring

* **Ülesanne: Mõtle ühele küsimusele, millele INNER JOIN aitab vastata. Kirjuta päring ja vaata tulemust.**

   * Millised kliendid tellisid viimase kuu jooksul?
   * Milliste toodete tellimustes on kõrgeim ühikuhind?
   * Millistest linnadest tulevad tellimused?

      ```sql
      SELECT
         p.product_name,
         p.category,
         s.store_location,
         s.unit_price,
         s.sale_date
      FROM sales s
      INNER JOIN products p ON s.product_id = p.product_id
      ORDER BY s.total_price DESC
      LIMIT 20;
      ```
      * **Kontrolltabel:**

        - [x] Minu päring kasutab INNER JOIN-i
        - [x] Minu päring kasutab ON klauslit õige ühendava veeruga
        - [x] Minu päring kasutab tabeli aliaseid


