# Nädal 2: SQL

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