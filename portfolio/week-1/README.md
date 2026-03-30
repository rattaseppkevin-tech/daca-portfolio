# <u>Nädal 1: SQL Basics</u>

### 1.3 Concrete Practice: SELECT harjutused

* **Harjutus 1A: Shu — kopeeri ja käivita**

* Ülesanne: Kopeeri järgmised päringud Supabase SQL Editorisse ja käivita need ükshaaval.

*  <u>Päring 1 — Vaata tabelit:</u>
```sql
SELECT *
FROM sales
LIMIT 5;
```
  > Mitu veergu sa näed? Kirjuta veergude nimed siia:  
  > Esimesed 5. Veergude nimed on sale_id, invoice_id, sale_data, customer_id jne.

* <u>Päring 2 — Vali konkreetsed veerud:</u>
```sql
SELECT sale_id, customer_id, total_price, sale_date
FROM sales
LIMIT 10;
```
  > Milline on suurim summa nende 10 rea seas?  
  > 7. rida ja summaks on 629.96.

* <u>Päring 3 — Sorteeri ja piira:</u>
```sql
SELECT sale_id, total_price AS summa
FROM sales
ORDER BY total_price DESC
LIMIT 5;
```
  > Milline on kõige suurem müük kogu tabelis?  
  > Kuna kasutame DESC funktsiooni, siis esimene rida, sale_id 2407 ja summa on 2170.4.

---

### Harjutus 1B: Shu/Ha — muuda malli

* Kirjuta oma päring siia (5 väikseimat müüki):
```sql
SELECT sale_id, total_price AS summa
FROM sales
ORDER BY total_price ASC
LIMIT 5;
```

* Milline on kõige väiksem müük?
>Esimene rida, sale_id 4221 ja summa on -1405.32.

* Kas sa näed 0-väärtusega või negatiivseid müüke?
>Kuna LIMIT on 5, siis näen ainult 5 kõige väiksemat summat ja nad kõik on miinusega summad.

---

### Harjutus 1C: Rakendus — vali ise veerud

* Sinu päring Toomase jaoks (kliendi ID, kuupäev, summa – uuemad enne):
```sql
SELECT customer_id, sale_date, total_price AS summa
FROM sales
ORDER BY sale_date DESC
LIMIT 20;
```

* **Kontrolltabel:**
  - [x] Minu päring kasutab SELECT-i konkreetsete veergudega (mitte *)
  - [x] Minu päring kasutab ORDER BY-d kuupäeva järgi kahanevalt
  - [x] Minu päring kasutab LIMIT-it

---

### 1.4 Conclusions: SELECT ja FROM kokkuvõte

**Reflektsioon:**

* Mis oli kõige üllatavam, kui sa esimest korda päris andmeid nägid?
> Kui lihtne ja hea on veergude kaupa asju filtreerida.

* Kuidas erineb SQL Excelist sinu senise kogemuse põhjal?
> Exceliga olen ma väga vähe kokku puutunud ainult andmeid lugenud sealt, aga SQL tundub palju võimsam selliste asjade jaoks.

* Mida tahaksid sessioonis 1 mentorilt küsida?
> Hetkel mul küsimused puuduvad.

---

### 2.1 Connection: Riidekapi filtreerimine

* Mitu tingimust sa kontrollid?
 > 2 tingimust (tüüp = särk ja värv = sinine).

* Kas mõlemad peavad olema tõesed?
 > Jah, sest kui üks neist on vale, siis tulemus pole see mida me otsime.

---

### 2.3 Concrete Practice: WHERE harjutused.

* **Harjutus 2A: Shu — kopeeri ja käivita**

* <u>Päring 1 - Mitu tellimust on üle 500 euro (eemalda LIMIT, et näha kõiki)?</u>
> Kui limiti eemaldan näen ainult 100 kuna supabase automaatselt limiteerib 100 peale, et kokku ei jookseks. Alumise koodiga sain vastuseks 2499.
```sql
SELECT COUNT(*)
FROM sales
WHERE total_price > 500;
```

* <u>Päring 2 - Mitu müüki oli 2024. aasta esimeses kvartalis?</u>
> Vastus on 1550.
```sql
SELECT COUNT(*)
FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-03-31'
```

* <u>Päring 3 - Mitu tellimust on ilma kliendi ID-ta?</u>
> Vastus on 1487.
```sql
SELECT COUNT(*)
FROM sales
WHERE customer_id IS NULL;
```

* **Harjutus 2B: Shu/Ha — kombineeri tingimusi**

* Toomas tahab näha kõiki tellimusi, mis vastavad KÕIGILE järgmistele tingimustele:
* Summa on üle 200 euro
* Tellimus on tehtud 2024. aastal
* *Lisaülesanne: Lisa kolmas tingimus — näita ainult konkreetse kanali (channel) tellimusi. Vali kanal ise. Vastus Lisa 1-s*

> Vastus on 1472.
```sql
SELECT COUNT (*)
FROM sales
WHERE total_price > 200 AND sale_date LIKE '%2024%' and payment_method = 'kaart';
```

* **Harjutus 2C: Rakendus — Toomase küsimus**

* Toomas küsib: "Näidake mulle kõik tellimused, kus midagi on kahtlast — kas summa on 0 või väiksem, või kliendi ID puudub." Kirjuta päring, mis leiab need "kahtlased" read.

```sql
SELECT *
FROM sales
WHERE total_price <= 0 OR customer_id IS NULL
```
* Kontrolltabel:
  - [x] Minu päring otsib summasid, mis on <= 0
  - [x] Minu päring otsib ka NULL customer_id väärtusi
  - [x] Ma kasutan OR-i, sest piisab ühest tingimusest

---

## 2.4 Conclusions: WHERE kokkuvõte

* **Reflektsioon**

* Mis oli kõige segasem koht WHERE juures? 
> Midagi segast pole hetkel kõlab loogilisena.
* Kas IS NULL oli üllatav? Miks SQL ei kasuta lihtsalt = NULL? 
>Esialgselt arvasin ka, et = NULL natuke oli üllatav.

---

## 3.3 Concrete Practice: DISTINCT ja COUNT harjutused

* **Harjutus 3A: Shu — kopeeri ja käivita**

* <u>Päring 1 — Tabeli üldpilt:</u>

* Ülesanne: Kopeeri järgmised päringud ja käivita need.
```sql
SELECT
    COUNT(*) AS ridade_arv,
    COUNT(customer_id) AS klientidega,
    COUNT(*) - COUNT(customer_id) AS puudub_klient,
    COUNT(DISTINCT customer_id) AS unikaalseid_kliente
FROM sales;
```
> Ridu kokku: 15234.
> Klientidega tellimusi: 13747.
> Puuduvaid kliente: 1487.
> Unikaalseid kliente: 2558.

* <u>Päring 2 — Unikaalsed kanalid:</u>
```sql
SELECT DISTINCT channel
FROM sales
ORDER BY channel;
```
> Millised kanalid on esindatud? Online ja Pood.

* <u>Päring 3 — Unikaalsed staatused:</u>
```sql
SELECT DISTINCT status
FROM sales
ORDER BY status;
```
> See kood annab vea teate mul kuna siin otsime veergu nimega "status".
```sql
SELECT DISTINCT channel AS väärtus FROM sales
UNION
SELECT DISTINCT payment_method FROM sales;
```
> Interneti abiga sai sellise lahenduse ja vastuseks on: järelmaks, kaart, online, pood ja sularaha.


* **Harjutus 3B: Shu/Ha — Toomase duplikaatide uurimine**

* Ülesanne: Toomas tahab teada täpselt, kui palju duplikaate on. Kasuta tema meetodit.

* <u>Samm 1: Leia kõigi ridade arv:</u>
```sql
SELECT COUNT(*) AS kokku FROM sales;
```
> Tulemus: 15234.

* <u>Samm 2: Leia unikaalsete sale_id-de arv:</u>
```sql
SELECT COUNT(DISTINCT sale_id) AS unikaalseid FROM sales;
```
> Tulemus: 10118.

* <u>Samm 3: Arvuta duplikaatide arv:</u>
```sql
SELECT 
    COUNT(*) AS kokku, 
    COUNT(DISTINCT sale_id) AS unikaalseid,
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaatseid
FROM sales;
```
>Kas see vastab Toomase hinnangule (5000+)? Jah vastus on 5116.
```sql
SELECT
    COUNT(*) AS kokku,
    COUNT(DISTINCT email) AS unikaalseid_emaile,
    COUNT(*) - COUNT(DISTINCT email) AS duplikaatseid
FROM customers;
```
>Duplikaatseid e-maile: 510.

* **Harjutus 3C: Rakendus — uurimisraport**

---
