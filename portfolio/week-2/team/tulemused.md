# Kvaliteedikontroll ja Ristvalideerimine

**Roll:** Kvaliteedikontrollija (Data Quality Analyst)

 * Mina kontrollisin andmete terviklikkust sales, customers ja products tabelite vahel.
Positiivne leid oli, et katkiseid seoseid ei leitud, kõik müügid on korrektsed.
Küll aga leidsin 664 hinna ebakõla ja 604 mitteaktiivset kirjet.(592 klienti kes pole kunagi ostnud ja 12 toodet mida pole kunagi müüdud).
See tähendab äriliselt, et meie hinnastamine võib olla vigane ning meil on kliente ja tooteid, mis ei too tulu.

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

Kõige kriitilisem probleem on 664 hinna ebakõla, sest need mõjutavad otseselt ettevõtte tulu ja finantsaruandluse täpsust.