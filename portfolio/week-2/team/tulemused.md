# Ristvalideerimise ja Kvaliteedikontrolli Raport (Kaart D)

## Sissejuhatus
Käesolev raport esitab andmete terviklikkuse analüüsi tulemused tabelite `sales`, `customers` ja `products` vahel. Eesmärk oli tuvastada "orbid" kirjed (seosteta andmed) ning kontrollida hindade loogilist kooskõla.

---

### Samm 1: Kliendiseoste kontroll
* **Küsimus:** Kas on müüke, mis viitavad olematule kliendile?
* **Tulemus:** **[0]** müüki viitab olematule kliendile.
* **Hinnang:** Andmebaasi seosed on korrektsed.

### Samm 2: Tooteseoste kontroll
* **Küsimus:** Kas on müüke, mis viitavad olematule tootele?
* **Tulemus:** **[0]** müüki viitab olematule tootele.
* **Hinnang:** Andmebaasi seosed on korrektsed.

---

### Samm 3: Hindade kooskõla
* **Kontroll:** Kas müügisumma (`total_price`) klapib valemiga: *tootehind * kogus*?
* **Leid:** **664** müügil ei klapi hind tootehinnaga.
* **Tähelepanek:** Tuvastati kriitiline viga, kus müügihinnad on märgitud negatiivsetena, mis tekitab suuri ebakõlasid finantsanalüüsis.

---

### Samm 4: Vaimkliendid
* **Leid:** **592** klienti pole kunagi ostnud.
* **Äriline mõju:** Need on registreerunud kasutajad, keda saaks turundusega aktiveerida.

### Samm 5: Vaimtooted
* **Leid:** **12** toodet pole kunagi müüdud.
* **Äriline mõju:** Võimalik asjatu laoseis või tooted, mida kliendid ei leia.

---

## Ristvalideerimise koondtabel (Samm 6)

| Kategooria | Leitud probleeme | Kirjeldus |
| :--- | :---: | :--- |
| **Orbid kliendid** | 0 | Müük viitab olematule kliendile |
| **Orbid tooted** | 0 | Müük viitab olematule tootele |
| **Hinna ebakõlad** | 664 | Müügihind ei klapi tootehinnaga (negatiivsed väärtused) |
| **Vaimkliendid** | 592 | Klient ei ole kunagi ostnud |
| **Vaimtooted** | 12 | Toodet pole kunagi müüdud |
| **KOKKU** | **1268** | |

---

## Eksperdi soovitus Toomasele
**Kõige kriitilisem probleem:** Hinna ebakõlad ja negatiivsed müügisummad.
**Põhjendus:** See on otsene viga raamatupidamises. Kui müük on märgitud negatiivsena, vähendab see kunstlikult ettevõtte käivet ja moonutab kasumlikkuse arvutust. Soovitan esmajärjekorras kontrollida müügisüsteemi sisestusloogikat.

## Kvaliteedikontroll:
- [x] Ristvalideerimine tehtud kõigi 3 tabeli vahel.
- [x] Orbid ja ebakõlad tuvastatud.
- [x] Raport sisaldab konkreetseid numbreid.