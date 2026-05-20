# Python APIs

---

## 1.3 Concrete Practice: API päringute harjutused

### Harjutus 1A: Ha — ühenda ja uuri

* **Ülesanne: Kopeeri järgmine kood ja käivita see. Kui sul pole Supabase ühendust, kasuta alternatiivset varianti näidisandmetega.**

    * Mitu tellimust laaditi? 1000
    * Mitu klienti on andmestikus? 1000
    * Mis veergude tüübid on DataFrame'is (dtypes)? float64(3), int64(3), str(5)
    * Mis erinevust märkad API laadimise ja CSV laadimise vahel? Klientide arvu vahe.

### Harjutus 1B: Ha — filtreeri ja kombineeri

* **Ülesanne: Kirjuta kood, mis toob Supabase'ist (või näidisandmetest) ainult konkreetse linna tellimused ja arvutab kokkuvõtte.**

    * Milline linn oli suurema kogukäibega?  Tallinn
    * Kas API filter (.eq) on kiirem kui pandas filter? Miks? API filter on märgatavalt kiirem. API filter (.eq) paneb andmebaasi (Supabase/PostgreSQL) tööle enne, kui andmed sinu arvutisse jõuavad.
    * Millal on mõistlik filtreerida API tasemel vs pandas tasemel? API tasemel filtreeri siis, kui sul on andmebaasis miljoneid ridu

### Harjutus 1C: Rakendus — loo oma päring

* **Ülesanne: Mõtle äriküsimusele, millele Marko vajaks vastust. Kirjuta API päring (või pandas filter), mis toob vajalikud andmed.**

    * **Kontrolltabel:**

     - [x] Minu päring toob konkreetse andmete alamhulga (mitte kõik)
     - [x] Ma oskan seletada, miks see filter on äriliselt kasulik
     - [x] Ma kontrollisin tulemust (shape, head, describe)

---

