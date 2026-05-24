# Python and Pandas

---

## 1.3 Concrete Practice: DataFrame harjutused

### Harjutus 1A: Ha — järgi malli ja uuri

* **Ülesanne: Kopeeri järgmine kood Jupyter Notebook'i (või Python faili) ja käivita see.**

    * **Küsimused tulemuse kohta:**
        * Mitu rida ja mitu veergu on DataFrame'is? 20 rida 5 veergu
        * Mis tüüpi on total_price veerg? float64.
        * Mis on keskmine tellimuse summa (describe väljundist)? 106.86
        * Mis on suurim üksiktellimus? 230.

### Harjutus 1B: Ha — uuri UrbanStyle andmeid sügavamalt

* **Ülesanne: Kasutades ülaltoodud DataFrame'i df, kirjuta kood, mis vastab järgmistele küsimustele.**

    * **Juhivad küsimused:**
        * Millisest linnast tuleb enim tellimusi? Tallinnast (10 tellimust ehk täpselt 50% kogumahust)
        * Kas see on üllatav, arvestades UrbanStyle'i profiili? Ei ole üllatav.
        * Kuidas sa sama küsimuse SQL-is vastaksid? kasutaks Group by ja count funktsioone.

### Harjutus 1C: Rakendus — oma uurimine

* **Ülesanne: Vali DataFrame'ist üks veerg, mida pole veel uuritud (nt product_category). Kirjuta 3-5 rida koodi, mis annavad sulle selle veeru kohta ülevaate.**

  * **Kontrolltabel:**

     - [x] Ma kasutasin vähemalt 3 erinevat pandas käsku (nt value_counts, unique, nunique, describe)
     - [x] Ma oskan kirjeldada, mida tulemused ärilisel tähendavad
     - [x] Ma märkasin midagi üllatavat või huvitavat

---

## 2.3 Concrete Practice: Andmete töötlemise harjutused

### Harjutus 2A: Ha — järgi malli ja kohanda

* **Ülesanne: Kopeeri ja käivita järgmine kood, mis replitseerib Week 1-4 SQL analüüse pandas'iga.**

    * Mis on Tallinna kogukäive? 889.79
    * Milline linn on keskmise tellimuse poolest esikohal? Pärnu
    * Mitu "suurt" tellimust on? 8

### Harjutus 2B: Ha — tee midagi, mida SQL ei suuda nii lihtsalt 

* **lesanne: Marko tahab teada iga kliendi ostukäitumist. Kirjuta kood, mis arvutab iga kliendi kohta: mitu korda ta ostis, kui palju ta kokku kulutas ja mis oli tema keskmine tellimus.**
    
    * Kes on kõige väärtuslikum klient? customer 1001.
    * Mitu VIP-klienti on? 5 
    * Miks see info on Markole kasulik? Saab teha ärilisi otuseid kampaaniaid vipidele, et neid hoida.

### Harjutus 2C: Rakendus — merge ja analüüs

* **Ülesanne: Loo teine DataFrame kliendiandmetega ja ühenda see müügiandmetega (merge). Analüüsi tulemust.**

 * **Kontrolltabel:**

     - [x] merge() töötab korrektselt (kontrollisid shape enne ja pärast)
     - [x] Ma oskan seletada, miks kasutasin how='left' (mitte how='inner')
     - [x] Tulemus näitab kliendi nime, mitte ainult ID-d

--- 

## 3.3 Concrete Practice: Plotly harjutused

### Harjutus 3A: Ha — järgi malli ja kohanda

* **Ülesanne: Kopeeri ja käivita järgmine kood. Seejärel muuda vähemalt ühte asja (pealkiri, värvid, diagrammi tüüp).**

    * Muuda pealkiri: Tehtud
    * Lisa text='total_price' parameetrina, et näha numbreid tulpadel. - Tehtud
    * Proovi fig.update_layout(showlegend=False) — kas see on parem? Mulle meeldib legend, aga võimalik et on parem.

### Harjutus 3B: Ha — loo oma visualiseerimine

* **Ülesanne: Loo kaks graafikut UrbanStyle andmetest, mis vastavad Marko küsimustele.**

    * Milline kuu oli kõige kasumlikum? Juuni
    * Mis protsent klientidest on VIP? 72%
    * Millist graafikut näitaksid sa Markole esimesena? Miks? Kuu käibe trendi kuna see on äri poole pealt tähtsam.

### Harjutus 3C: Rakendus — andmelugu graafikuga

* **Ülesanne: Mõtle äritegevusele, mida sa tahaksid Markole näidata. Loo üks graafik, mis räägib loo.**

    * **Kontrolltabel:**

     - [x] Graafik on korrektselt sildistatud (pealkiri, teljed)
     - [x] Graafik vastab konkreetsele äriküsimusele
     - [x] Ma oskan seletada, mida graafik näitab (30 sekundit)

---

