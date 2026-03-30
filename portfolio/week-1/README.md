# Nädal 1: SQL Basics

### Harjutus 1A: Shu — kopeeri ja käivita

* **Päring 1 — Vaata tabelit:**
  > Mitu veergu sa näed? Kirjuta veergude nimed siia:  
  > Esimesed 5. Veergude nimed on sale_id, invoice_id, sale_data, customer_id jne.

* **Päring 2 — Vali konkreetsed veerud:**
  > Milline on suurim summa nende 10 rea seas?  
  > 7. rida ja summaks on 629.96.

* **Päring 3 — Sorteeri ja piira:**
  > Milline on kõige suurem müük kogu tabelis?  
  > Kuna kasutame DESC funktsiooni, siis esimene rida, sale_id 2407 ja summa on 2170.4.

---

### Harjutus 1B: Shu/Ha — muuda malli
* **Kirjuta oma päring siia (5 väikseimat müüki):**
```sql
SELECT sale_id, total_price AS summa
FROM sales
ORDER BY total_price ASC
LIMIT 5;
```

* **Milline on kõige väiksem müük?** 
>Esimene rida, sale_id 4221 ja summa on -1405.32.

* **Kas sa näed 0-väärtusega või negatiivseid müüke?**
>Kuna LIMIT on 5, siis näen ainult 5 kõige väiksemat summat ja nad kõik on miinusega summad.

---

### Harjutus 1C: Rakendus — vali ise veerud
* **Sinu päring Toomase jaoks (kliendi ID, kuupäev, summa – uuemad enne):**
```sql
SELECT customer_id, sale_date, total_price AS summa
FROM sales
ORDER BY sale_date DESC
LIMIT 20;
```
  __________________________________________________________________________

* **Kontrolltabel:**
  - [x] Minu päring kasutab SELECT-i konkreetsete veergudega (mitte *)
  - [x] Minu päring kasutab ORDER BY-d kuupäeva järgi kahanevalt
  - [x] Minu päring kasutab LIMIT-it

---

### 1.4 Conclusions: SELECT ja FROM kokkuvõte
**Reflektsioon:**

* **Mis oli kõige üllatavam, kui sa esimest korda päris andmeid nägid?**
> Kui lihtne ja hea on veergude kaupa asju filtreerida.

* **Kuidas erineb SQL Excelist sinu senise kogemuse põhjal?**
> Exceliga olen ma väga vähe kokku puutunud ainult andmeid lugenud sealt, aga SQL tundub palju võimsam selliste asjade jaoks.

* **Mida tahaksid sessioonis 1 mentorilt küsida?**
> Hetkel mul küsimused puuduvad.

---

### 2.1 Connection: Riidekapi filtreerimine
* **Mitu tingimust sa kontrollid?**
 > 2 tingimust (tüüp = särk ja värv = sinine).

* **Kas mõlemad peavad olema tõesed?**
 > Jah, sest kui üks neist on vale, siis tulemus pole see mida me otsime.

### 2.3 Concrete Practice: WHERE harjutused.

* **Harjutus 2A: Shu — kopeeri ja käivita**

* Päring 1 - Mitu tellimust on üle 500 euro (eemalda LIMIT, et näha kõiki)?
> Kui limiti eemaldan näen ainult 100 kuna supabase automaatselt limiteerib 100 peale, et kokku ei jookseks. Alumise koodiga sain vastuseks 2499.
```sql
SELECT COUNT(*)
FROM sales
WHERE total_price > 500;
```

* Päring 2 - Mitu müüki oli 2024. aasta esimeses kvartalis?
> Vastus on 1550.
```sql
SELECT COUNT(*)
FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-03-31'
```

* Päring 3 - Mitu tellimust on ilma kliendi ID-ta?
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
> Vastus on 4233.
```sql
SELECT COUNT (*)
FROM sales
WHERE total_price > 200 AND sale_date LIKE '%2024%';
```