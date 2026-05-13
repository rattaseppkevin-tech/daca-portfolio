# Python and Pandas

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
