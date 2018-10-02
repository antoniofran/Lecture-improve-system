
USE `lecture_improve`;

#####################################

INSERT INTO `application_user_role`
	(
		`name`
	,	`description`
	)
VALUES
	(
		'admin'
	,	'Administrator "upravlja user/course/human tablicama", "mapira course s human" te "start/stop anketna razdoblja".'
	)
,	(
		'teacher'
	,	'Nastavnik "gleda izvještaj kvalitete nastave svojih kolegija" te "odgovara na anonimne komentare/pitanja studenata".'
	)
,	(
		'student'
	,	'Student "formira izvještaj kvalitete nastave svojih kolegija" te "upućuje anonimne komentare/pitanja profesorima".'
	)
,	(
		'preview'
	,	'Preview "pregledava izgled survey/feedback za sutudent rolu" i "pregledava izgled survey/feedback za teacher rolu".'
	)
;

##############################################

INSERT INTO `survey_element_type`
	(
		`input_title`
	,	`output_title`
	,	`description`
	,	`order`
	)
VALUES
	(
		'Ocjenjivanje kvalitete nastavnih prostora'
	,	'Poboljšavanje kvalitete nastavnih prostora'
	,	'Koliko dobro nastavni prostori podupiru nastavu?'
	,	1
	)
,	(
		'Ocjenjivanje kvalitete nastavnih izvođača'
	,	'Poboljšavanje kvalitete nastavnih izvođača'
	,	'Koliko dobro nastavni izvođač obavlja svoje uloge?'
	,	2
	)
,	(
		'Ocjenjivanje kvalitete nastavnih sadržaja'
	,	'Poboljšavanje kvalitete nastavnih sadržaja'
	,	'Koliko dobro nastavni sadržaji pokrivaju gradivo?'
	,	3
	)
;

/*****************************/

INSERT INTO `survey_element`
	(
		`type_id`
	,	`input_text`
	,	`output_text`
	,	`order_in_type`
	)
VALUES
	(
		1
	,	'Ocijenite kvalitetu zadržavanja u prostoru u smislu količine privatnog prostora prilikom sjedenja i rasprostranjenosti prirodnog svjetla.'
	,	'Fokusirati se na poboljšavanje kvalitete zadržavanja u prostoru putem organiziranja stolaca tako da svaki član publike može imati što više privatnog pastora i putem organiziranja prozora tako da vanjsko svjetlo ravnomjerno obasjava prostoriju.'
	,	1
	)
,	(
		1
	,	'Ocijenite kvalitetu umjetnog osvjetljenja u smislu raspoređenosti rasvjete i usklađenosti te rasvjete i boje zidova od kojih se ista reflektira.'
	,	'Fokusirati se na poboljšavanje kvalitete umjetnog osvjetljenja putem ravnomjernije raspoređenosti rasvjete dok se ima u vidu boja zidova od koje će se to svjetlo reflektirati.'
	,	2
	)
,	(
		1
	,	'Ocijenite kvalitetu temperature prostora u smislu ravnomjernosti postavljanja klima uređaja, radijatora i ostalih uređaja za regulaciju temperature u prostoriji.'
	,	'Fokusirati se na poboljšavanje temperature prostora putem ravnomjernog postavljanja klima uređaja, radijatora i ostalih uređaja za regulaciju temperature u prostoriji.'
	,	3
	)
,	(
		1
	,	'Ocijenite kvalitetu konzumiranja nastave u smislu vidljivosti pozornice i lakoće slušanja zvuka koji dolazi s pozornice.'
	,	'Fokusirati se na uvjete konzumiranja nastave putem bolje organizacije odnose sjedišta i pozornice te putem osiguravanja dobre ozvučenosti prostorije putem ravnomjernog postavljanja zvučnika dok se ima u vidu kako se zvuk reflektira od zidova.'
	,	4
	)
,	(
		1
	,	'Ocijenite uvjete izvođenja nastave u smislu organiziranosti prostora pozornice u svrhu demonstracije gradiva i prostora sjedišta u svrhu interakcije s članovima publike.'
	,	'Fokusirati se na uvjete izvođenje nastave putem praktičnijeg dizajna pozornice u svrhu demonstracije gradiva i putem ostavljanja mjesta za kretanje prostorom publike radi interakcije s članovima publike.  !!!! dodati opremu samu (računala i drugo) ovdje ili na neki drugi stadij, ažurirati sustav potom'
	,	5
	)
,	(
		2
	,	'Ocijenite kvalitetu prijenosa znanja koje je se očekuje da usvojite tijekom studija uzevši u obzir koliko se nastavnici trude da vas zainteresiraju za iste.'
	,	'Fokusirati se na poboljšanje kvalitete prijenosa znanja studentima i održavanje interesa studenata za sadržaj nastave.'
	,	1
	)
,	(
		2
	,	'Ocijenite koliko vas nastavnici usmjeravaju prema vašim interesima/željama uzevši obzir koliko vam pomažu da iste uskladite s zahtjevima studija.'
	,	'Fokusirati se na usmjeravanje studenata prema njegovim interesima/željama i pomoći mu da iste uskladi s zahtjevima studija.'
	,	2
	)
,	(
		2
	,	'Ocijenite koliko vas osoblje obrazovne ustanove tretira jednako sebi uzevši u obzir koliko vi to isto osoblje trenirate jednako sebi.'
	,	'Fokusirati te sa na tretiranje studenta kao jednakog sebi, pogotovo tijekom rješavanja konfliktnih situacija.'
	,	3
	)
,	(
		2
	,	'Ocijenite količinu odnosno kvalitetu ne-nastavnog znanja koji vam nastavnici prenesu radi lakšeg uspjeha u vašem daljnjem životu. '
	,	'Fokusirati se na prijenos svog životnog iskustva studentima kako bi se lakše snašli u svom budućem životu.'
	,	4
	)
,	(
		2
	,	'Ocijenite kvalitetu nastavnika kao uzora u pogledu njihovog zanimanja odnosno u pogledu njihovog života općenito.'
	,	'Fokusirati se da primjerom vlastitog života pružate studentima stabilan i pouzdan uzor u njihovom životu.'
	,	5
	)
,	(
		3
	,	'Ocijenite kvalitete u prezentacija kolegija u smislu količine teksta, preglednosti i važnosti gradiva koji se prezentira, uzevši u obzir zahtjeve kolegija.'
	,	'Fokusirati se na to da se prezentacije kolegija učine što preglednijima, manje teksta i samo najvažnije gradivo na njima.'
	,	1
	)
,	(
		3
	,	'Ocijenite kvalitetu skripti kolegija u smislu sveobuhvatnosti gradiva kolegija i toga koliko dobro je sažeto i organizirano to gradivo unutar skripte.'
	,	'Fokusirati se na to da se u skriptama kolegija što preglednije i sažetije prezentira svo gradivo kolegija.'
	,	2
	)
,	(
		3
	,	'Ocijenite kvalitetu stručnih i drugih literatura na temu kolegija koje su preporučene i/ili kojima imate omogućen pristup od strane izvođača kolegija.'
	,	'Fokusirati se na to da se studentima omogući pristup što kvalitetnijim stručnim i drugim literaturama u pogledu kolegija.'
	,	3
	)
,	(
		3
	,	'Ocijenite kvalitetu javno objavljenih radova na temu kolegija kojima vam je omogućen pristup u smislu uzora za vlastiti rad na temu kolegija.'
	,	'Fokusirati se na to da se studentima omogući pristup što kvalitetnijim radovima koji su povezani s kolegijom i mogu biti uzor na radove na temu kolegija.'
	,	4
	)
,	(
		3
	,	'Ocijenite kvalitetu online i drugih sadržaji koji su vam preporučeni i/ili je omogućen vam pristup istima, uzevši u obzir to koliko vam pomažu savladati gradivo kolegija.'
	,	'Fokusirati se na to da se studentima omogući pristup što kvalitetnijim online i drugih sadržajima vezanim uz temu kolegija, pogotovo ukoliko olakšavaju savladavanje kolegija.'
	,	5
	)
;

##############################################

INSERT INTO `survey_feedback_type`
	(
		`input_title`
	,	`output_title`
	,	`description`
	)
VALUES
	(
		'Komentari u pogledu nastave ovog kolegija'
	,	'Odgovori na komentare u pogledu nastave ovog kolegija'
	,	'Povratna informacija studenata.'
	)
,	(
		'Pitanja u pogledu nastave ovog kolegija'
	,	'Odgovori na pitanja u pogledu nastave ovog kolegija'
	,	'Pitanje studenata upućeno profesorima.'
	)
;

#####################################

SHOW TABLE STATUS;