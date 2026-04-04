# Nädal 2: SQL Puhastamine.

 ---

## 1.3 Concrete Practice: Duplikaatide harjutused

### Harjutus 1A: Shu — järgi malli (10 min)

* **Ülesanne: Kopeeri järgmine päring Supabase SQL Editorisse ja käivita see.**

    ```sql
    -- Leia kõik duplikaatsed sale_id väärtused sales tabelis
    SELECT
         sale_id,
         COUNT(*) AS koopiate_arv
    FROM sales
    GROUP BY sale_id
    HAVING COUNT(*) > 1
    ORDER BY koopiate_arv DESC
    LIMIT 10;
    ```
    * Mitu erinevat sale_id-d esineb rohkem kui korra?
        > Kõik 10 tulemust esinevad rohkem kui korra.
    * Milline sale_id on kõige rohkem duplikeeritud?
        > sale_id 4256 ja 2706 mõlemal näitab 6 duplikaati.
    * Mitu koopiat sellel on?
        > 6 duplikaati.
    
    ```sql
    -- Duplikaatide mõju müüginumbritele
    SELECT
        COUNT(*) AS ridu_kokku,
        COUNT(DISTINCT sale_id) AS unikaalseid,
        COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate,
        SUM(total_price) AS summa_duplikaatidega,
        (SELECT SUM(total_price) FROM (
            SELECT DISTINCT ON (sale_id) total_price
            FROM sales
            ORDER BY sale_id, sale_date
        ) unikaalsed) AS summa_ilma_duplikaatideta
    FROM sales;
    ```
    * Duplikaatide rahaline mõju (vahe):
        > Summa duplikaatidega on: 4,374,231.27 ja ilma 2,898,901.28 vahe on 1,475,329.99 eurot.

### Harjutus 1B: Ha — ROW_NUMBER() kasutamine

* **Ülesanne: Kirjuta päring, mis kasutab ROW_NUMBER() funktsiooni, et nummerdada customers tabeli read email veeru järgi. Nii leiad kliendid, kellel on sama e-mail mitu korda.**
    * Vihjed:
        * PARTITION BY email
        * ORDER BY customer_id (väikseim ID = esimene kirje)
        * Filtreeri tulemustest ainult read, kus rn > 1 (need on duplikaadid)

    ```sql
    SELECT *
    FROM (
        SELECT
            email,
            customer_id,
            ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
        FROM customers
    ) AS subquery
    WHERE rn > 1;
     ```

     * Mitu duplikaatset e-maili on customers tabelis?
        > 129.
     * Kas duplikaatsetel klientidel on ka erinev nimi?
        > Jah on, pealmiselt on need suurte ja väikeste tähtede eksimused.
     * Miks see probleem võib tekkida? (nt klient registreeris end mitu korda)
        > Kui reklaame või mingeid kampaaniaid teha, siis kliendile tuleb üks ja sama E-mail mitu korda.

### Harjutus 1C: Rakendus — oma duplikaatide audit

* **Ülesanne: Vali ise tabel (nt products või customers) ja kontrolli, kas seal on duplikaate. Otsusta ise, millise veeru järgi duplikaati defineerida.**
    ```sql
    SELECT SUM(koopiad) AS duplikaatide_koguarv
    FROM (
        SELECT
            phone,
            COUNT(*) AS koopiad
        FROM customers
        GROUP BY phone
        HAVING COUNT(*) > 1
    ) AS alam_paring;
    ```

    * **Kontrolltabel:**
        - [x] Minu päring kasutab GROUP BY + HAVING COUNT() > 1
        - [x] Ma oskan põhjendada, miks valisin just selle veeru duplikaadi aluseks
        - [x] Ma dokumenteerisin tulemuse (mitu duplikaati leiti)

