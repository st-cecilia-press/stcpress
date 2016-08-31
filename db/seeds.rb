# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

manuscripts = Manuscript.create([
{ slug: 'canconiero_de_palacio', name: 'Canconiero de Palacio', archive: 'Palacio Real, Biblioteca [E-Mp]', shelfmark: '1335', diamm: 1157, description: 'manuscript of polyphony , c. 1505-20; provenance: Spain'},
{ slug: 'bamberg', name: 'Bamberg Codex', archive: 'Staatsbibliothek [D-BAs]', shelfmark: 'Lit. 115', diamm: 863, description: 'theory treatises and polyphony , second half of 13th century; provenance: France'},
{ slug: 'cz_chrm_12580', name: 'CZ-CHRm 12580', archive: 'Mestske Muzeum [CZ-CHRm]', shelfmark: '12580', diamm: 1063, description: 'chant book with added polyphony , 16th century; provenance: Bohemia'},
{ slug: 'montpellier', name: 'Montpellier Codex', archive: 'Faculté de Médecine [F-MO]', shelfmark: 'H 196', diamm: 888, description: 'manuscript of polyphony , c. 1280 and later. late 13th-early 14th century; provenance: France'},
{ slug: 'wolfenbuttel', name: 'Wolfenbüttel Chansonnier', archive: 'Herzog August Bibliothek [D-W]', shelfmark: 'Cod. Guelf. 287 Extrav.', diamm: 2016, description: 'manuscript of polyphony , c. 1461-5; provenance: France'},
{ slug: 'gb_ob_ms_ashmole_191', name: 'GB-Ob MS. Ashmole 191', archive: 'Bodleian Library [GB-Ob]', shelfmark: 'MS. Ashmole 191', diamm: 488, description: 'non-music MS with interpolated music , 15th century: c.1445-60; provenance: England'},
{ slug: 'henry_viii', name: 'Henry VIII Manuscript', archive: 'British Library [GB-Lbl]', shelfmark: 'Add. MS 31922', diamm: 1238, description: 'manuscript of polyphony , c. 1510-20; provenance: England'},
{ slug: 'selden_carol_book', name: 'The Selden Carol Book', archive: 'Bodleian Library [GB-Ob]', shelfmark: 'MS. Arch. Selden B. 26', diamm: 803, description: 'composite of 5 unrelated manuscripts bound together in 17th century, 1425-40, c.1450, later addition (f.33v) c. 1500; provenance: England'},
{ slug: 'agincourt_roll', name: 'Agincourt Roll', archive: 'Trinity College [GB-Ctc]', shelfmark: 'O.3.58', diamm: 320, description: 'rotulus , Early 15th century; provenance: England'},
{ slug: 'llibre_vermell', name: 'Llibre Vermell', archive: 'Monasterio de S Maria [E-MO]', shelfmark: 'MS 1', diamm: 69, description: 'non-music manuscript with music interpolations, End of 14th or 1st quarter of 15th century; provenance: Spain'},
{ slug: 'carmina_burana', name: 'Carmina Burana', archive: 'Bayerische Staatsbibliothek [D-Mbs]', shelfmark: 'Clm MSS 4660', diamm: nil, description: ''},
{ slug: 'gb_lbl_harley_978', name: 'GB-Lbl Harley 978', archive: 'British Library [GB-Lbl]', shelfmark: 'Harley 978', diamm: 434, description: 'non-music MS with interpolated music , Late 13th century; provenance: England'},
{ slug: 'f_pn_fonds_francais_25566', name: 'F-PN fonds français 25566', archive: 'Bibliothèque Nationale [F-PN]', shelfmark: 'fonds français 25566', diamm: 896, description: 'non-music MS with interpolated music , second half of 13th century; provenance: France'},
{ slug: 'codex_squarcialupi', name: 'Codex Squarcialupi', archive: 'Biblioteca Medicea-Laurenziana [I-Fl]', shelfmark: 'MS Mediceo Palatino 87', diamm: 671, description: 'manuscript of polyphony , 14th century; provenance: Italy'},
{ slug: 'd_leu_ms_1236', name: 'D-LEu MS 1236', archive: 'Universitätsbibliothek [D-LEu]', shelfmark: 'MS 1236', diamm: 1865, description: 'manuscript of polyphony , Mid 15th century; provenance: Bavaria'},
{ slug: 'gb_occ_ms_59', name: 'GB-Occ MS 59', archive: 'Corpus Christi College [GB-Occ]', shelfmark: 'MS 59', diamm: 558, description: 'non-music MS with interpolated music , 13th century; provenance: England'}
])

books = Book.create([
{ slug: 'bateson_first_set_of_english_madrigals', title: "The First Set of English Madrigals to 3, 4, 5, and 6 Voices", date: Date.new(1604)},
{ slug: 'ravenscroft_deuteromelia', title: "Deuteromelia", date: Date.new(1609)},
{ slug: 'croce_canzonette_a_tre_voce', title: "Canzonette a Tre Voce", date: Date.new(1601)},
{ slug: 'dowland_first_book_of_songs', title: "First Book of Songs or Ayres", date: Date.new(1597)},
{ slug: 'dowland_second_book_of_songs', title: "Second Book of Songs or Ayres", date: Date.new(1600)},
{ slug: 'lassus_tiers_livre_des_chansons', title: "TIERS LIVRE DES CHANSONS A QVATRE CINCQ ET six parties, nouuellement composées par Orlando di Lassus", date: Date.new(1566)},
{ slug: 'youll_canzonets_to_three_voyces', title: "Canzonets to three voyces", date: Date.new(1608)},
{ slug: 'willaert_motetti_novi_e_chanzoni_franciose', title: "Motetti novi e chanzoni franciose a quatro sopra doi", date: Date.new(1520)},
{ slug: 'ravenscroft_a_brief_discourse', title: "A Brief Discourse", date: Date.new(1614)},
{ slug: 'praetorius_musae_sione_ix', title: "Musae Sione IX", date: Date.new(1610)},
{ slug: 'praetorius_musae_sione_vi', title: "Musae Sione VI", date: Date.new(1609)},
{ slug: 'ein_aussbund_schoner_teutscher_liedlein', title: "Ein außbund schöner Teutscher Liedlein zu singen, vnd auff allerley Jnstrument, zugebrauchen, sonderlich außerlesen", date: Date.new(1560)},
{ slug: 'arcadelt_il_primo_libro_di_madrigali', title: "Il primo libro di madrigali d'Archadelt a tre voci", date: Date.new(1542)},
{ slug: 'phalese_premier_livre_du_recueil_des_fleurs', title: "Premier Livre Dv Recveil Des Flevrs Prodvictes De La Divine Mvsicqve a Trois Parties De par Clemens non Papa Thomas Cricquillon & aultres excellens Musichiens", date: Date.new(1560)},
{ slug: 'attaignant_37_chansons_musicales', title: "37 Chansons musicales a quatre parties", date: Date.new(1528)},
{ slug: 'morley_first_book_of_balletts', title: "The First book of Balletts to Five Voyces", date: Date.new(1595)},
{ slug: 'attaignant_51_galliards_pavans_bransles_and_basse_dances', title: "51 Galliards, Pavans, Bransles and Basse Dances", date: Date.new(1530)},
{ slug: 'le_roy_ballard_tiers_livre_de_chansons', title: "Tiers Livre de chansons à quatre parties de Ja. Arcadet et autres.", date: Date.new(1567)},
{ slug: 'orchesographie', title: "Orchesographie", date: Date.new(1589)},
{ slug: 'morley_madrigals_to_4_voyces', title: "Madrigals to Foure Voyces", date: Date.new(1594)},
{ slug: 'petrucci_frottole_iii', title: "Frottolle Libro Tertio", date: Date.new(1504)},
{ slug: 'attaignant_chansons_nouvelles_tiers_livre', title: "Tiers liure contenant xxix. Chansons NOVVELLES A QVATRE PARTIES", date: Date.new(1540)},
{ slug: 'gibbons_first_set_of_madrigals', title: "The First Set of Madrigals and Mottets of 5 Parts Newly Composed by Orlando Gibbons", date: Date.new(1612)},
{ slug: 'lassus_libro_de_villanelle', title: "Libro de villanelle, moresche, ed altre canzoni", date: Date.new(1582)},
{ slug: 'farmer_first_book_of_madrigals', title: "The first set of English madrigals to foure voices: newly composed by Iohn Farmer", date: Date.new(1599)},
{ slug: 'bennet_madrigals_to_four_voices', title: "Madrigals to Four Voyces newly published by John Bennet", date: Date.new(1599)},
{ slug: 'ravenscroft_pammelia', title: "Pammelia", date: Date.new(1609)},
{ slug: 'byrd_gradualia', title: "Graudualia Cantiones Sacrae", date: Date.new(1610)},
{ slug: 'attaignant_31_chansons_musicale', title: 'Trente et une Chansons Musicale', date: Date.new(1529) },
{ slug: 'attaignant_chansons_vieilles_esleves_iii', title: "Tiers livre contenant xxx. Chansons vieilles esleves", date: Date.new(1538)},
{ slug: 'azzaiolo_primo_libro_de_viollotte', title: "Il Primo Libro de Villotte alla Padoana con alcune Napolitane a quatro voci intitolate Villotte del fiore", date: Date.new(1564)},
{ slug: 'morley_canzonettes_to_three_voyces_1606', title: "Canzonets to Three Voyces", date: Date.new(1606)}
])

