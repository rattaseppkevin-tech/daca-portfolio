# Visualiseerimise disain

## Concrete Practice: Diagrammitüübi valik

### Harjutus 1A: Shu — otsusta malli järgi

* **Ülesanne: Iga stsenaariumi kohta vali ÜÖIGE diagrammitüüp. Kirjuta vastus ja põhjendus.**

    * Stsenaarium 1: Anna küsib: "Kuidas on meie Instagram'i jälgijate arv muutunud viimase 6 kuu jooksul?"

        * Diagrammitüüp: Joondiagramm
        * Miks: Paremini loeatavam kui näidata nt rohkem kui 6 kuud.

    * Stsenaarium 2: Kristi küsib: "Mis on meie TOP 5 kategooriat müüdud koguse järgi?

        * Diagrammitüüp: Tulpdiagramm
        * Miks: Tulpdiagrammid on hea valik kategooriate võrdlemiseks.

    * Stsenaarium 3: Anna küsib: "Kuidas jaguneb meie turunduseelarve kanalite vahel — Facebook, Google, Instagram, Email?"

        * Diagrammitüüp: Sõõrikdiagramm
        * Miks: Hea viis näidata osakaalu.

    * Stsenaarium 4: Kristi küsib: "Mis on meie kõige olulisem number investorile?"

        * Diagrammitüüp: KPI kaart
        * Miks: See on üks suur number kogutulu, kasum jms.

    * Stsenaarium 5: Anna küsib: "Kas kampaania eelarve suurus ja klientide arv on omavahel seotud?"

        * Diagrammitüüp: Hajuvusdiagramm
        * Miks: Hajuvusdiagrammi kasutatakse kahe muutuja vahelise korrelatsiooni ehk seose leidmiseks.

### Harjutus 1B: Ha — vali ja JOONISTA paberil

* **Ülesanne: Allpool on UrbanStyle'i andmed. Vali igale andmekogumile sobiv diagrammitüüp ja joonista see paberile (skeem piisab — ei pea olema ilus).**

    * Andmekogum A — müük kuude kaupa: Jan: €18 500, Feb: €17 200, Mar: €20 100, Apr: €22 300, Mai: €21 800, Jun: €24 500

        * Sinu diagrammitüübi valik: Joondiagramm

    * Andmekogum B — TOP 5 toodet käibe järgi: Denim Jacket: €45 000 Urban Sneakers: €35 000 Hoodie Classic: €28 000 Street Tee: €21 000 Canvas Bag: €16 000

        * Sinu diagrammitüübi valik: Tulpdiagramm
    
    * Andmekogum C — müük linnade lõikes: Tallinn: 42%, Online: 28%, Tartu: 18%, Pärnu: 12%

        * Sinu diagrammitüübi valik: Söörikdiagramm.
    
    * **Juhivad küsimused:**

        * Milline diagramm oli kõige lihtsam joonistada? Miks? Tulpdiagramm erineva suurusega ristkülikud.
        * Milline andmekogum sobiks ka teist tüüpi diagrammiga? Milline ja miks? Andmekogum A (müük kuude kaupa) sobiks väga hästi ka tulpdiagrammiga. Kui soovid rõhutada mitte trendi, vaid iga kuu konkreetset panust näiteks.
        * Kas Kristi saaks sinu joonistustest 10 sekundiga aru? Jah ma usun küll.

### Harjutus 1C: Rakendus — oma äriküsimus

* **Ülesanne: Mõtle ise UrbanStyle'i äriküsimusele, mida ühelgi eelneval nädalal pole käsitletud. Kirjuta küsimus, vali diagrammitüüp ja selgita valikut.**

    * Sinu äriküsimus: Kas kampaaniad (promotions) tõstavad reaalselt müügitulu või me lihtsalt müüme odavamalt sama koguse kaupa?
    * Diagrammitüüp: Kombineeritud tulp- ja joondiagramm
    * Miks just see diagramm? Saame tulpadega näidata müügitulu (tulu) ja joonega kampaania soodustuse suurust samal ajal.
    * Mis andmeid sa vajaksid? (millistest tabelitest?) Sales ja promotions

    * **Kontrolltabel:**

        - [x] Minu küsimus on konkreetne äriküsimus (mitte "näita kõiki andmeid")
        - [x] Ma oskan selgitada, MIKS see diagrammitüüp sobib
        - [x] Ma tean, millistest andmebaasi tabelitest andmed tuleksid

---

## 2.3 Concrete Practice: Dashboard'i paigutuse kavandamine

### Harjutus 2A: Shu — analüüsi malli järgi

* **Ülesanne: Vaata alltoodud dashboard'i paigutust ja vasta küsimustele.**

### UrbanStyle Investor Dashboard — Q4 2024

| **Käive** | **Kliendid** | **Kesk. tellimus** | **Kasv (vs Q3)** |
| :--- | :--- | :--- | :--- |
| €305K | 2 500 | €32 | **+15%** |

---

### 📈 Müügitulu trend (Jan-Dec)
*Siia tuleb joondiagramm: Y-telg (EUR), X-telg (Kuud)*

---

| TOP 5 toodet (Käibe järgi) | Müük linnade lõikes |
| :--- | :--- |
| 1. **Denim Jacket** (€45K) | 📍 **Tallinn**: 42% |
| 2. **Sneakers** (€35K) | 💻 **Online**: 28% |
| 3. **Hoodie** (€28K) | 📍 **Tartu**: 18% |
| 4. **Street Tee** (€21K) | 📍 **Pärnu**: 12% |

---
**Filtrid:** `[ Periood ▾ ]` `[ Linn ▾ ]` `[ Kategooria ▾ ]`

* **Küsimused:**

    * Milline element on kõige olulisem (esimesena nähtav)? KPI kaardid (üleval reas) — need annavad kohe kätte kõige kriitilisemad numbrid (käive ja kliendid).
    * Miks on joondiagramm suurim element? Sest see näitab trendi aja jooksul. Investoritele on olulisem näha stabiilset kasvu kui üksikuid punkte; see on dashboardi peamine "lugu".
    * Miks on sektordiagrammil ainult 4 kategooriat? Et säiliks loetavus. Liiga palju sektoreid muudab diagrammi segaseks ja mitte loetavaks.
    * Kus on filtrid ja miks just seal? Pigem küljel siis nad ei sega andmete lugemist.

    * **Kas see dashboard vastab Kristi 4 küsimusele? Millisele küsimusele vastab iga element?**

        * "Kas me kasvame?" → Joondiagramm ja kasvu KPI (+15%)
        * "Mis tooted müüvad?" → TOP 5 toodet (tulpdiagramm)
        * "Kust tulevad kliendid?" → Müük linnade lõikes (sektor)
        * "Kas marketing töötab?" → Kliendiarvu KPI ja müügitrendi tipud kampaaniate ajal.
 
### Harjutus 2B: Ha — kavanda Kristi investori dashboard paberil

* **Ülesanne: Kristi vajab investori pitch'i dashboard'i. Joonista paberile dashboard'i paigutus (wireframe). Kasuta 3-5 elementi.**

    * Juhivad küsimused:

       * Milline element on su dashboard'il kõige suurem? Miks? Suurim element: Joondiagramm, sest trend näitab äri jätkusuutlikkust.
       * Mitu elementi sul kokku on? Kas see on piisav? Elementide arv: 5, see on piisav, et mitte investorit infoga lämmatada.
       * Kas Z-muster töötab — kas investor näeb esimesena kõige olulisemat? Z-muster: Jah, olulisim number (Käive) on vasakul ülal nurgas.

### Harjutus 2C: Rakendus — Data-ink ratio audit

* **Ülesanne: All on kirjeldatud "halb" dashboard. Leia kõik chart junk elemendid ja kirjelda, milline näeks see välja pärast puhastamist.**

    * Chart junk elemendid (7 tükki): 3D efektid,Gradiendid, Varjud (drop shadows), Mustriga taust, Liigne legend (korduv info), Liiga palju ruudustikujooni (15 jooni on liig), Liigne täpsus (2 komakohta suurte summade puhul)

    * Puhastatud dashboard'i kirjeldus: ashboard on minimalistlik ja puhas, kasutades tasapinnalist (2D) disaini ja valget tausta. Kõik üleliigsed varjud ja jooned on eemaldatud, jättes alles vaid andmed. Numbrid on ümardatud täisühikuteni (nt €32K), mis muudab need hetkega loetavaks ja fokuseerib tähelepanu sisule.

    * **Kontrolltabel:**

        - [x] Ma eemaldasin 3D efektid
        - [x] Ma eemaldasin dekoratiivsed elemendid
        - [x] Ma lihtsutasin numbrid (€32K, mitte €32 156,78)
        - [x] Ma jätsin ainult andmeid kandvad elemendid

---

## 3.3 Concrete Practice: Filtrite planeerimine

### Harjutus 3A: Shu — filtrite loogika malli järgi

* **Ülesanne: Täida järgmine tabel — planeeri UrbanStyle'i investori dashboard'i filtrid.**

    | Filter | Tüüp | Vaikeväärtus | Valikud | Miks vajalik? |
    | :--- | :--- | :--- | :--- | :--- |
    | **Periood** | Kuupäeva vahemik | Viimased 12 kuud | Kuu, kvartal, aasta | Võimaldab näha värsket trendi ja võrrelda seda eelmiste perioodidega. |
    | **Linn** | Slicer (loend) | Kõik linnad | Tallinn, Tartu, Pärnu, Online | Aitab analüüsida piirkondlikku edukust ja turuosa jaotust. |
    | **Kategooria** | Slicer (loend) | Kõik kategooriad | Denim, Sneakers, Hoodie jne | Tuvastab, millised konkreetse tooterühma kampaaniad on tulusaimad. |
    
   * **Küsimused:**

        * Miks on "viimased 12 kuud" parem vaikeväärtus kui "kogu aeg"? Sest see hoiab fookuse kõige aktuaalsemal infol; liiga vanad andmed võivad tänast äripilti moonutada.
        * Kas "Online" peaks olema eraldi valik linnafiltris? Miks? Jah, sest see võimaldab võrrelda digitaalse kanali efektiivsust füüsiliste poodide asukohtadega.
 
### Harjutus 3B: Ha — interaktiivsuse planeerimine paberil

* **Ülesanne: Joonista paberile oma Osa 2 dashboard'i paigutus ja planeeri, kuidas filtrid ja cross-filtering töötaksid.**

    * **Stsenaarium 1: Investor klikib "Tartu"**

        * KPI kaardid: Näitavad tulu ja klientide arvu ainult Tartu kohta.
        * Joondiagramm: Näitab Tartu müügitrendi (joon langeb/tõuseb vastavalt sealsetele andmetele).
        * Tulpdiagramm: Näitab Tartu TOP 5 tooteid.
        * Sektordiagramm: Tõstetakse esile Tartu osa (või jääb staatiliseks, kui see on terviku näitamiseks).

    * **Stsenaarium 2: Investor klikib "Q4 2024"**

        * KPI kaardid: Uuenevad ainult oktoober-detsember 2024 summadele.
        * Joondiagramm: "Suumib sisse" ja näitab ainult neljanda kvartali kuusid.
        * Milline küsimus vastuse saab? "Kuidas meil läks pühadeperioodil?"

    * **Stsenaarium 3: Investor klikib sektordiagrammil "Online"**

        * Teised diagrammid: Peaksid näitama ainult veebimüügi trendi ja veebis populaarseid tooteid.
        * Kas KPI kaardid muutuvad? Jah, need peavad näitama veebikanali kogutulu ja unikaalseid veebikliente.

    * **Juhtivad küsimused:**

        * Raskeim stsenaarium: Tavaliselt Stsenaarium 3, sest see eeldab, et diagramm ise toimib filtrina (visual interaction).
        * Kas kõik filtrid mõjutavad kõike? Üldiselt jah, aga erandina võib joondiagramm jääda vahel "kogu aja" vaatesse, et pakkuda võrdlusmomenti valitud filtriga.
   
### Harjutus 3C: Rakendus — dual-track planeerimine

* **Ülesanne: Vali oma rada (Track A: Power BI, Track B: Plotly + Streamlit) ja planeeri, kuidas sa oma dashboard'i filtrid realiseerid.**

    * Kuna sa toimetad Power BI-s, on siin sinu vastused:
    * Millise visual'i kasutad? Slicer (kas rippmenüü või nimekirjana).
    * Kus ekraanil paigutad? Ülemisse serva või vasakusse paneeli (standardkoht).
    * Kas cross-filtering on automaatne? Jah, Power BI-s on see vaikimisi sisse lülitatud (kui klikid ühel graafikul, muutuvad ka teised).

    * **Kontrolltabel:**

        - [x] Ma oskan nimetada 3 põhifiltrit oma dashboard'il
        - [x] Ma saan aru cross-filtering'u loogikast
        - [x] Ma tean, kuidas oma tööriistas (Power BI / Plotly) filtrit realiseerida

---

## Concrete Practice: Integreeriv harjutus — terviklik dashboard'i kavand

### Ülesanne: Kavanda paberil terviklik UrbanStyle'i investori dashboard. See on su kõige olulisem harjutus sellel nädalal — paneme kokku kõik kolm osa.

### Samm 1: Äriküsimused
1. **"Kas me kasvame?"** → Joondiagramm (Trend)
2. **"Mis tooted müüvad?"** → Horisontaalne tulpdiagramm (Top 5)
3. **"Kust tulevad kliendid?"** → Sektordiagramm (Linnade jaotus)
4. **"Kas marketing töötab?"** → KPI kaart (Kliendiarv ja konversioon)

*   **Kõige olulisem küsimus investorile:** "Kas me kasvame?" (Müügitulu trend ja kasvuprotsent).

### Samm 2: KPI kaardid (Dashboardi päis)
| KPI | Number (näidis) | Muutus | Miks just see? |
| :--- | :--- | :--- | :--- |
| **Kogutulu** | €305 000 | +15% | Äri kogumaht ja skaleeritavus. |
| **Klientide arv** | 2 500 | +8% | Kliendibaasi laienemine. |
| **Keskmine tellimus** | €122 | +2% | Müügiefektiivsus kliendi kohta. |
| **Turunduse ROI** | 4.2x | +0.5 | Kampaaniafondide kasutuse tasuvus. |

### Samm 3: Dashboard'i paigutus (Wireframe)
**Paigutuse loogika:**
*   **Ülal:** 4 KPI kaarti (Väikesed, selged numbrid).
*   **Keskel (Suur):** Joondiagramm (Müügitulu 12 kuud). Vastab: "Kas me kasvame?".
*   **All Vasakul (Keskmine):** Tulpdiagramm (TOP 5 toodet). Vastab: "Mis tooted müüvad?".
*   **All Paremal (Keskmine):** Sektordiagramm (Linnad/Online). Vastab: "Kust tulevad kliendid?".
*   **Paremal ääres või all:** Filtrid (Aeg, Linn, Kategooria).

### Samm 4: Filtrite plaan
| Filter | Vaikeväärtus | Mõju dashboard'ile |
| :--- | :--- | :--- |
| **Periood** | Viimased 12 kuud | Uuendab kõiki trende ja summasid vastavalt ajale. |
| **Linn** | Kõik asukohad | Võimaldab võrrelda poode ja veebimüüki. |
| **Kategooria** | Kõik kategooriad | Filtreerib TOP tooted ja vastava kategooria müügitulu. |

### Samm 5: Cross-filtering test
*   **Element:** Sektordiagramm -> Sektor "Online"
*   **Klikk → Mis muutub?**
    *   **KPI-d:** Näitavad ainult e-poe tulu ja keskmist ostukorvi.
    *   **Diagramm 1 (Joon):** Näitab veebimüügi kasvu dünaamikat ajas.
    *   **Diagramm 2 (Tulp):** Näitab ainult neid tooteid, mida ostetakse kõige rohkem veebist.

### Samm 6: 30-sekundi test
*   **Esimene asi, mida märkab:** Kogutulu number ja joondiagrammi suund (kas see liigub üles).
*   **Peamine sõnum:** UrbanStyle on kasvav ja kasumlik bränd, millel on tugev haare Tallinnas ja veebis.
*   **Kas ta teab tööriista?** Ei pea teadma (ja tavaliselt ei huvita). Oluline on info selgus, mitte see, et see on tehtud Power BI-s.
*   **Number, mida kolleegile öelda:** "Nad kasvasid eelmisel kvartalil 15% ja teenisid üle 300 tuhande!"