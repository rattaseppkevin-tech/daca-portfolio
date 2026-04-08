# Kvaliteedikontroll ja Ristvalideerimine

**Roll:** Kvaliteedikontrollija (Data Quality Analyst)

> "Mina teostasin **andmete ristvalideerimise ja terviklikkuse kontrolli**. Leidsin, et süsteemidevahelised seosed on puhtad (**0 orbu**), kuid tuvastasin **664 hinna ebakõla** ja **592 tehinguteta kirjet**. See tähendab äriliselt, et meie **hinnakiri on aegunud** (tegelik müügihind on kuni 68% kõrgem) ja **finantsaruandlus on ebatäpne** negatiivsete müügisummade tõttu."

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

## Soovitus Toomasele

**Probleem:** Kõige kriitilisem leid on negatiivsed müügisummad ja suur erinevus listihinna ning tegeliku müügihinna vahel (kuni 68%). 

**Mõju:** See tähendab, et ettevõtte kasumiarvutused on praegu ebatäpsed. Me arvame, et müüme odavalt, aga tegelikult müüme kallimalt – või vastupidi. Meie "andmebaasi tõde" ei vasta reaalsetele tehingutele.