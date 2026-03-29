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
SELECT sale_id, total_price AS summa
FROM sales
ORDER BY total_price ASC
LIMIT 5;

* **Milline on kõige väiksem müük?** 
Esimene rida, sale_id 4221 ja summa on -1405.32.

* **Kas sa näed 0-väärtusega või negatiivseid müüke?**
Kuna LIMIT on 5, siis näen ainult 5 kõige väiksemat summat ja nad kõik on miinusega summad.

---

### Harjutus 1C: Rakendus — vali ise veerud
* **Sinu päring Toomase jaoks (kliendi ID, kuupäev, summa – uuemad enne):**
SELECT customer_id, sale_date, total_price AS summa
FROM sales
ORDER BY sale_date DESC
LIMIT 20;
  __________________________________________________________________________

* **Kontrolltabel:**
  - [ ] Minu päring kasutab SELECT-i konkreetsete veergudega (mitte *)
  - [ ] Minu päring kasutab ORDER BY-d kuupäeva järgi kahanevalt
  - [ ] Minu päring kasutab LIMIT-it

---

### 1.4 Conclusions: SELECT ja FROM kokkuvõte
**Reflektsioon:**

* **Mis oli kõige üllatavam, kui sa esimest korda päris andmeid nägid?**
  __________________________________________________________________________

* **Kuidas erineb SQL Excelist sinu senise kogemuse põhjal?**
  __________________________________________________________________________

* **Mida tahaksid sessioonis 1 mentorilt küsida?**
  __________________________________________________________________________
