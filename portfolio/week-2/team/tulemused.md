# Kvaliteedikontroll ja Ristvalideerimine

**Roll:** Kvaliteedikontrollija (Data Quality Analyst)

 * Mina teostasin andmete terviklikkuse kontrolli, sales, customers ja products tabelite vahel.
 Tuvastasin, et meie süsteemidevahelised seosed on veatud kõik müügid on korrektselt seotud reaalsete klientide ja toodega. Kuid tuvastasin 664 hinna ebakõla ja 604 tehinguta kirjet (592 vaimklienti ja 12 vaimtoodet.)
 See tähendab äriliselt, et meie andmebaas sisaldab palju "tühja müra", mis moonutab meie hinnakirja ja finantsaruandlust.

---

## Ristvalideerimise koondtabel (Samm 6)

| Kategooria | Leitud probleeme | Kirjeldus |
| :--- | :---: | :--- |
| **Orbid kliendid** | 0 | Müük viitab olematule kliendile (Korrastatud) |
| **Orbid tooted** | 0 | Müük viitab olematule tootele (Korrastatud) |
| **Hinna ebakõlad** | 664 | Müügihind ei klapi tootehinnaga (Kriitiline) |
| **Vaimkliendid** | 592 | Klient ei ole kunagi ostnud (Turundusvõimalus) |
| **Vaimtooted** | 12 | Toodet pole kunagi müüdud (Laoseisu risk) |
| **KOKKU** | **1268** | **Tuvastatud ebakõlade koguarv** |

---

## Eksperdi soovitus Toomasele

**Kõige kriitilisem probleem:** 664 hinna ebakõla.

**Miks see on ohtlik?** See ei ole ainult tehniline viga, vaid otsene finantsrisk. Kui müügihind ja listihind ei klapi, ei saa me usaldada kasumiaruandeid ega marginaale. See tähendab, et me teeme äriotsuseid "pimeduses".