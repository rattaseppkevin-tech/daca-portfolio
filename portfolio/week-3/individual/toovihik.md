# Nädal 3 SQL JOINs

---

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

---

### 2.3 Concrete Practice: LEFT JOIN harjutused

* **Harjutus 2A: Shu — järgi malli**

   ```sql
   -- Kadunud kliendid: LEFT JOIN + WHERE IS NULL
   SELECT
      c.customer_id,
      c.first_name || ' ' || c.last_name AS nimi,
      c.email,
      c.city,
      c.registration_date
   FROM customers c
   LEFT JOIN sales s ON c.customer_id = s.customer_id
   WHERE s.sale_id IS NULL
   ORDER BY c.registration_date DESC;
   ```
   * Mitu "kadunud" klienti leidsid?
      > 599 passiivset klienti.
   * Millisest linnast on enim kadunud kliente?
      > Sellise päringu puhul raske öelda, tundub olevat Tartust.
   * Millal registreerus kõige vanem kadunud klient?
      > 2020-01-02

      * **Nüüd käivita INNER JOIN versioon samade tabelitega:**

      ```sql
      -- Võrdluseks: INNER JOIN (ainult aktiivsed kliendid)
      SELECT COUNT(DISTINCT c.customer_id) AS aktiivseid_kliente
      FROM sales s
      INNER JOIN customers c ON s.customer_id = c.customer_id;
      ```

      * Kui palju aktiivseid kliente on?
         > 2551
      * Arvuta: kadunud + aktiivsed = _____ (kas see vastab kõigi klientide arvule?)
         > 2551 + 599 = 3150 peab paika.

### Harjutus 2B: Ha — tooted ilma müügita

* **Ülesanne: Anna küsib: "Millised tooted on meie kataloogis, aga neid pole kunagi müüdud? Need võtavad laoruumi ja seovad raha!" Kirjuta ise päring, mis leiab müümata tooted.**
   
   ```sql
   SELECT
      p.product_name,
      p.category,
      p.cost_price,    -- See on summa, millega me toote sisse ostsime (seotud raha)
      p.retail_price,  -- See on summa, millega me lootsime seda müüa
      p.retail_price - p.cost_price AS oodatav_kasum -- Arvutame, millest me ilma jääme
   FROM products p
   LEFT JOIN sales s ON p.product_id = s.product_id
   WHERE s.sale_id IS NULL
   ORDER BY p.cost_price DESC;
   ```

   * Mitu müümata toodet leidsid?
      > 12
   * Millises kategoorias on enim müümata tooteid?
      > Aksessuaarid
   * Mis võiks olla põhjus, miks neid ei osteta?
      > Ma küll tänapäeva stiilist ei tea midagi, aga katlane tundub, et keegi keraamilist salli või puust mütsi kannaks.
      > Ehk, siis tegu on imelikkude toodetega minu arvates.

### Harjutus 2C: Rakendus — kadunud klientide analüüs

* **Ülesanne: Anna tahab teada rohkem kadunud klientide kohta. Kirjuta päring, mis grupeerib kadunud kliendid linnade kaupa ja näitab, mitu kadunud klienti on igas linnas.**

   ```sql
   SELECT
      c.city,                             -- Näitame linna nime
      COUNT(c.customer_id) AS kadunud_kliendid -- Loeme kokku kliendid selles linnas
   FROM customers c
   LEFT JOIN sales s ON c.customer_id = s.customer_id
   WHERE s.sale_id IS NULL                 -- Ainult need, kellel pole müüke
   GROUP BY c.city                         -- Grupeerime linnade kaupa
   ORDER BY kadunud_kliendid DESC;
   ```
  * **Kontrolltabel:**

    - [x] Minu päring kasutab LEFT JOIN + WHERE IS NULL
    - [x] Minu päring grupeerib (GROUP BY) linnade kaupa
    - [x] Minu päring loeb kadunud klientide arvu igas linnas (COUNT)

---
