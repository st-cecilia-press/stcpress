# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

manuscripts = Manuscript.create([
{ name: 'Canconiero de Palacio', archive: 'Palacio Real, Biblioteca [E-Mp]', shelfmark: '1335', diamm: 1157, description: 'manuscript of polyphony , c. 1505-20; provenance: Spain'},
{ name: 'Bamberg Codex', archive: 'Staatsbibliothek [D-BAs]', shelfmark: 'Lit. 115', diamm: 863, description: 'theory treatises and polyphony , second half of 13th century; provenance: France'},
{ name: 'CZ-CHRm 12580', archive: 'Mestske Muzeum [CZ-CHRm]', shelfmark: '12580', diamm: 1063, description: 'chant book with added polyphony , 16th century; provenance: Bohemia'},
{ name: 'Montpellier Codex', archive: 'Faculté de Médecine [F-MO]', shelfmark: 'H 196', diamm: 888, description: 'manuscript of polyphony , c. 1280 and later. late 13th-early 14th century; provenance: France'},
{ name: 'Wolfenbüttel Chansonnier', archive: 'Herzog August Bibliothek [D-W]', shelfmark: 'Cod. Guelf. 287 Extrav.', diamm: 2016, description: 'manuscript of polyphony , c. 1461-5; provenance: France'},
{ name: 'GB-Ob MS. Ashmole 191', archive: 'Bodleian Library [GB-Ob]', shelfmark: 'MS. Ashmole 191', diamm: 488, description: 'non-music MS with interpolated music , 15th century: c.1445-60; provenance: England'},
{ name: 'Henry VIII Manuscript', archive: 'British Library [GB-Lbl]', shelfmark: 'Add. MS 31922', diamm: 1238, description: 'manuscript of polyphony , c. 1510-20; provenance: England'},
{ name: 'The Selden Carol Book', archive: 'Bodleian Library [GB-Ob]', shelfmark: 'MS. Arch. Selden B. 26', diamm: 803, description: 'composite of 5 unrelated manuscripts bound together in 17th century, 1425-40, c.1450, later addition (f.33v) c. 1500; provenance: England'},
{ name: 'Agincourt Roll', archive: 'Trinity College [GB-Ctc]', shelfmark: 'O.3.58', diamm: 320, description: 'rotulus , Early 15th century; provenance: England'},
{ name: 'Llibre Vermell', archive: 'Monasterio de S Maria [E-MO]', shelfmark: 'MS 1', diamm: 69, description: 'non-music manuscript with music interpolations, End of 14th or 1st quarter of 15th century; provenance: Spain'},
{ name: 'Carmina Burana', archive: 'Bayerische Staatsbibliothek [D-Mbs]', shelfmark: 'Clm MSS 4660', diamm: nil, description: ''},
{ name: 'GB-Lbl Harley 978', archive: 'British Library [GB-Lbl]', shelfmark: 'Harley 978', diamm: 434, description: 'non-music MS with interpolated music , Late 13th century; provenance: England'},
{ name: 'F-PN fonds français 25566', archive: 'Bibliothèque Nationale [F-PN]', shelfmark: 'fonds français 25566', diamm: 896, description: 'non-music MS with interpolated music , second half of 13th century; provenance: France'},
{ name: 'Codex Squarcialupi', archive: 'Biblioteca Medicea-Laurenziana [I-Fl]', shelfmark: 'MS Mediceo Palatino 87', diamm: 671, description: 'manuscript of polyphony , 14th century; provenance: Italy'},
{ name: 'D-LEu MS 1236', archive: 'Universitätsbibliothek [D-LEu]', shelfmark: 'MS 1236', diamm: 1865, description: 'manuscript of polyphony , Mid 15th century; provenance: Bavaria'},
{ name: 'GB-Occ MS 59', archive: 'Corpus Christi College [GB-Occ]', shelfmark: 'MS 59', diamm: 558, description: 'non-music MS with interpolated music , 13th century; provenance: England'}
])

books = Book.create([
{ title: "The First Set of English Madrigals to 3, 4, 5, and 6 Voices", date: 1604},
{ title: "Deuteromelia", date: 1609},
{ title: "Canzonette a Tre Voce", date: 1601},
{ title: "First Book of Songs or Ayres", date: 1597},
{ title: "TIERS LIVRE DES CHANSONS A QVATRE CINCQ ET six parties, nouuellement composées par Orlando di Lassus", date: 1566},
{ title: "Canzonets to three voyces", date: 1608},
{ title: "Motetti novi e chanzoni franciose a quatro sopra doi", date: 1520},
{ title: "A Brief Discourse", date: 1614},
{ title: "Musae Sione IX", date: 1610},
{ title: "Ein außbund schöner Teutscher Liedlein zu singen, vnd auff allerley Jnstrument, zugebrauchen, sonderlich außerlesen", date: 1560},
{ title: "Il primo libro di madrigali d'Archadelt a tre voci", date: 1542},
{ title: "Premier Livre Dv Recveil Des Flevrs Prodvictes De La Divine Mvsicqve a Trois Parties De par Clemens non Papa Thomas Cricquillon & aultres excellens Musichiens", date: 1560},
{ title: "37 Chansons musicales a quatre parties", date: 1528},
{ title: "The First book of Balletts to Five Voyces", date: 1595},
{ title: "51 Galliards, Pavans, Bransles and Basse Dances", date: 1530},
{ title: "Tiers Livre de chansons à quatre parties de Ja. Arcadet et autres.", date: 1567}
])

