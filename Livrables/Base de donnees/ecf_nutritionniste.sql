/* Create schema - START */

/* Create schema */
CREATE SCHEMA ecf_nutritionniste;
USE ecf_nutritionniste;

/* Create schema - END */

/* Create all the tables - START */

/* Create table users */
CREATE TABLE users (
  id VARCHAR(36) NOT NULL PRIMARY KEY,
  email VARCHAR(254) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `roles` VARCHAR(40) NOT NULL,
  /*user_ID VARCHAR(36) NOT NULL PRIMARY KEY,
  user_email VARCHAR(254) NOT NULL,
  user_password VARCHAR(60) NULL,
  user_role VARCHAR(40) NOT NULL,
  */
  user_lastname VARCHAR(60) NOT NULL,
  user_firstname VARCHAR(60) NOT NULL,
  user_phone VARCHAR(20) NOT NULL,
  user_allergen_ID INT(11) NULL REFERENCES allergens(allergen_ID) ON DELETE CASCADE,
  user_diet_ID INT(11) NULL REFERENCES diets(diet_ID) ON DELETE CASCADE
) ENGINE=INNODB;

/* Create table contacts */
CREATE TABLE contacts (
  contact_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  contact_lastname VARCHAR(60) NOT NULL,
  contact_firstname VARCHAR(60) NOT NULL,
  contact_phone VARCHAR(20) NOT NULL,
  contact_email VARCHAR(255) NOT NULL,
  contact_title VARCHAR(255) NOT NULL,
  contact_message TEXT(1000) NOT NULL
) ENGINE=INNODB;

/* Create table allergens */
CREATE TABLE allergens (
  allergen_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  allergen_name VARCHAR(60) NOT NULL
) ENGINE=INNODB;

/* Create table diets */
CREATE TABLE diets (
  diet_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  diet_name VARCHAR(60) NOT NULL
) ENGINE=INNODB;

/* Create table recipes */
CREATE TABLE recipes (
  recipe_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  recipe_image_name VARCHAR(100) NULL,
  recipe_image_size INT(8) NULL,
  recipe_updated_at DATE NULL,
  /*
  image_name VARCHAR(100) NULL,
  image_size INT(8) NULL,
  updated_at DATE NULL,
  */
  recipe_title VARCHAR(255) NOT NULL,
  recipe_description VARCHAR(255) NULL,
  recipe_prep_duration INT(8) NOT NULL,
  recipe_rest_duration INT(8) NOT NULL,
  recipe_cook_duration INT(8) NOT NULL,
  recipe_ingredient TEXT(1000) NOT NULL,
  recipe_step TEXT(1000) NOT NULL,
  recipe_allergen_ID INT(11) NULL REFERENCES allergens(allergen_ID) ON DELETE CASCADE,
  recipe_diet_ID INT(11) NULL REFERENCES allergens(diet_ID) ON DELETE CASCADE,
  recipe_is_public BOOLEAN NOT NULL
) ENGINE=INNODB;

/* Create table opinions */
CREATE TABLE opinions (
  opinion_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  opinion_user_ID VARCHAR(36) NULL REFERENCES users(user_ID) ON DELETE CASCADE,
  opinion_recipe_ID INT(11) NULL REFERENCES recipes(recipe_ID) ON DELETE CASCADE,
  opinion_message TEXT(1000) NOT NULL,
  opinion_rate INT(2) NOT NULL,
  opinion_is_validated BOOLEAN NOT NULL
) ENGINE=INNODB;

/* Create all the tables - END */


/* Fulfill the tables - START */

/* Fulfill the table users */

INSERT INTO users (id, email, `password`, `roles`, user_lastname, user_firstname, user_phone, user_allergen_ID, user_diet_ID) VALUES
  (uuid(), 'sandrine.coupart@poudlard.com', NULL, '["ROLE_ADMIN"]', 'coupart', 'sandrine', '06 01 02 03 04', '', ''),
  (uuid(), 'ronald.weasley@poudlard.com', NULL, '["ROLE_EMPLOYE"]', 'weasley', 'ronald', '06 05 06 07 08', '1', '2'),
  (uuid(), 'luna.lovegood@poudlard.com', NULL, '["ROLE_EMPLOYE"]', 'lovegood', 'luna', '06 09 08 07 06', '2', ''),
  (uuid(), 'hermione.granger@poudlard.com', NULL, '["ROLE_EMPLOYE"]', 'granger', 'hermione', '06 08 07 06 05', '', '1');

/* Fulfill the table contacts */

INSERT INTO contacts (contact_ID, contact_lastname, contact_firstname, contact_email, contact_phone, contact_title, contact_message) VALUES
  (NULL, 'Rogue', 'Severus', 'severus.rogue@poudlard.com', '06 01 02 03 24', 'Nouvelle recette de gambas', "Bonjour. Pourriez-vous écrire une recette de gambas au curry sans gluten, svp?" ),
  (NULL, 'Mcgonagall', 'Minerva', 'minerva.mcgonagall@poudlard.com', '06 05 06 07 18', 'Pâtes à la bolognaise', "Ayant un régime sans sel, j'ai testé la recette de pâtes à la bolognaise mais sans mettre de sel mais c'est moins bon. C'est normal?"),
  (NULL, 'Black', 'Sirius', 'sirius.black@poudlard.com', '06 05 16 27 18', "Demande d'inscription", "Bonjour, comment fait-on pour s'inscrire?"),
  (NULL, 'Dumbledore', 'Albus', 'albus.dumbledore@poudlard.com', '07 08 09 10 11', 'Gigots vegan', "J'ai beau chercher, je ne trouve pas de recette de gigot vegan. Pourriez-vous m'envoyer le lien de la recette, svp?");

/* Fulfill the table allergens */

INSERT INTO allergens (allergen_ID, allergen_name) VALUES
  (NULL, 'oeuf'),
  (NULL, 'lait'),
  (NULL, 'moutarde'),
  (NULL, 'arachide'),
  (NULL, 'crustacé'),
  (NULL, 'poisson'),
  (NULL, 'sésame'),
  (NULL, 'soja'),
  (NULL, 'sulfite'),
  (NULL, 'noix'),
  (NULL, 'blé');

/* Fulfill the table diets */

INSERT INTO diets (diet_ID, diet_name) VALUES
  (NULL, 'végétarien'),
  (NULL, 'flexitarien'),
  (NULL, 'anticholestérol'),
  (NULL, 'sans sel'),
  (NULL, 'sans gluten'),
  (NULL, 'sans lactose'),
  (NULL, 'hypocalorique');

/* Fulfill the table recipes */

INSERT INTO recipes (recipe_ID, recipe_image_name, recipe_image_size, recipe_updated_at, recipe_title, recipe_description, recipe_prep_duration, recipe_rest_duration, recipe_cook_duration, recipe_ingredient, recipe_step, recipe_allergen_ID, recipe_diet_ID, recipe_is_public) VALUES
  (NULL, '', '', '', "Salade de chou blanc à la japonaise", "Fameuse salade croquante de chou, vinaigrée-sucrée, d’inspiration japonaise et vietnamienne.", 10, 260, 0, "1 petit chou blanc ou ½ d’un gros|graines de sésame blanc grillé (ou du gomasio)|300 ml de vinaigre de riz (à défaut utiliser du vinaigre de cidre)|3 cuil. à soupe de sucre roux|sel fin|2 cuil. à soupe de nuoc-mân|3 cuil. à soupe d’huile neutre (tournesol ou autre)|1 cuil. à thé de sauce soja", "Coupez le chou très fin : je l’ai fait au couteau, l’idéal c’est de le faire avec une mandoline pour qu’il soit encore plus fin. Disposez-le dans un grand saladier, recouvrez-le d’eau froide, ajoutez une cuillerée à soupe de sel, mélangez et laissez tremper 20 minutes.|La marinade|Versez le vinaigre dans un bol, ajoutez le sucre et une pincée de sel et fouettez légèrement avec une fourchette pour émulsionner le tout.|Egouttez bien le chou. Sécher le saladier et y remettre le chou.|Verser la marinade sur le chou et mélangez bien. L’idéal est de mélanger avec les mains à ce que le chou soit bien enrobé de marinade.|Laissez mariner minimum 1 heure, possiblement 4 heures, comme j’ai fait. Cette étape est fondamentale : grâce à cette marinade à base de vinaigre et sucre, le chou ramollit tout en restant croquant. Il va rendre de l’eau et, chose importante, il devient plus digeste. Pour rendre son eau il a besoin de mariner longuement, voilà pourquoi il vaut mieux prévoir 4 heures.|La salade|Au bout de ce temps, égouttez le chou en le pressant très fort entre vos mains, une poignée après l’autre, jusqu’à ce qu’il rende complètement son jus qui est à jeter, tout comme la marinade. Une fois bien égoutté, disposez le chou dans un autre saladier.|Assaisonnez la salade de chou avec la vinaigrette, préparée en émulsionnant dans un bol le nuoc-mân, l’huile et la sauce soja. Saupoudrez de sésame grillé et servez.", '', '', TRUE),
  (NULL, '', '', '', "Salade de roquette au vinaigre balsamique", "La roquette a un goût prononcé, qui apprécie un assaisonnement doux.", 15, 0, 0, "500 g de salade roquette|1 c. café de moutarde ancienne|1 c. soupe de vinaigre balsamique|1 c. soupe d’huile d’olive vierge extra", "Jeter les feuilles abîmées ou fanées. Couper les tiges si elles sont grosses. Garder les feuilles tendres pour la salade. Laver soigneusement sous l’eau froide. Égoutter. Essorer.|Préparer la vinaigrette au fond du saladier, en mélangeant moutarde et vinaigre. Ajouter l’huile et émulsionner.|Ajouter la roquette. Mélanger juste avant de servir.", '', '', FALSE),
  (NULL, '', '', '', "Salade de champignons de Paris au parmesan", "Une salade rapide, légère et fraîche.", 15, 0, 0, "200 g de champignons de Paris, 1 échalote, 1 gousse d’ail, 2 c. à soupe d’huile d’olive vierge, 1 c. à soupe de vinaigre balsamique, parmesan (en copeaux ou râpé), 1/2 citron, sel, poivre", "Nettoyer les champignons de Paris : les peler et enlever le pied. Les couper en lamelles et les disposer dans un saladier.|Peler et émincer l’échalote. La mélanger aux champignons.|Dans un ramequin à part, préparer la vinaigrette : mélanger huile d’olive et vinaigre balsamique. Comme les champignons vont boire très vite la vinaigrette, la diluer avec 4 cuillères à soupe d’eau. Peler l’ail, l’émincer et l’ajouter à la vinaigrette. Réserver.|Juste avant le service, bien mélanger la vinaigrette avec les champignons. Verser progressivement en mélangeant pour que tous les champignons soient parfumés. Ajouter le parmesan et le jus du demi citron. Servir.", '', '', TRUE),
  (NULL, '', '', '', "Salade argentine de cœurs de palmier", "Recette facile de salade", 15, 0, 0, "1 boîte de cœurs de palmier, égouttés, en rondelles|1 grappe de tomates cerises, coupées en deux|1 avocat pelé et coupé en dès|1 c. à soupe de jus de citron vert|1 c. à soupe de jus d’orange frais|¼ tasse d’huile d’olive extra vierge|sel, poivre|oignons verts hachés|coriandre fraîche ciselée", "Dans le bol de service, mélanger les jus, le sel, le poivre et l’huile. Ajouter les oignons verts et la coriandre.|Ajouter les cœurs de palmier, les tomates et l’avocat. Mélanger délicatement pour enrober.", '', '', TRUE),
  (NULL, '', '', '', "Mamaliga (polenta roumaine)", "", 5, 30, 0, "2 tasses de semoule (ou farine tamisée) de maïs|4 à 5 tasses d’eau|sel|beurre", "Mettre l’eau à chauffer dans un chaudron en fonte ou tchïaoune. Saler et saupoudrer d’un peu de semoule.|Dès le premier bouillon, ajouter la semoule en pluie, progressivement, tout en fouettant. Cesser de verser lorsque la mamaliga commence à épaissir mais continuer de fouetter constamment pour que le mélange reste lisse, pendant environ 20 minutes à petits bouillons, jusqu’à ce que tout le liquide ait été absorbé et qu’elle soit bien cuite.|Pour vérifier la cuisson, planter un bâton rond (le manche d’une cuillère en bois) au milieu de la préparation, en le faisant tourner sur lui-même : s’il en ressort sec, la mamaliga est cuite. Sinon, poursuivre la cuisson.|À l’aide d’une cuillère en bois ramener la mamaliga des bords vers le milieu. Lisser et tasser la mamaliga en tapotant sur le dessus.|Renverser la mamaliga sur une planche en bois ou sur une assiette. Humecter de beurre fondu pour éviter qu’elle ne sèche en surface. Servir tiède, en quartiers coupés au fil à beurre ou au couteau.", '', '', TRUE),
  (NULL, '', '', '', "Soupe japonaise « Gen Maï »", "Soupe traditionnelle du matin, dans les temples zen.", 20, 60, 120, "125 g de riz rond (semi complet ou complet)|1 belle carotte|1 petit navet|1 petit poireau|1 branche de céleri|(ajustez en fonction des légumes que vous avez, chou, betterave, etc.)|4 bols d’eau environ", "Faites tremper le riz dans l’eau tiède (1h minimum pour du riz complet).|Dans une casserole, faites chauffer 4 bons bols d’eau. À ébullition, ajoutez le riz et son eau de trempage et continuez la cuisson à feu plutôt fort.|Attendez que le riz soit très cuit (les grains doivent être bien éclatés). C’est plus long avec du riz complet.|Ajoutez vos légumes découpés, saupoudrez d’herbes aromatiques, et lorsque ça bout de nouveau, réduisez le feu le plus possible. Remuez de temps en temps. Laissez sur le feu, 1h, 2h ou plus (traditionnellement, cette soupe cuit une nuit entière à feu très doux).|Servez agrémenté d’un trait d’huile de sésame, de gomasio, de paillettes de nori (algue séchée), de piment, germes de blé, sauce soja, tamari, etc. suivant votre inspiration.", '', '', FALSE),
  (NULL, '', '', '', "Pasta alla carbonara", "Recette traditionnelle des pâtes à la carbonara, très populaire dans la cuisine italienne, aussi bien dans les familles que dans les restaurants. À base de pâtes, d’œufs et de poivre noir fraîchement moulu.", 5, 0, 15, "     600 g de pâtes italiennes sèches [*] longues : spaghetti, linguine, rigatoni, bucatini…|6 jaunes d’œuf|250 g de guanciale (joue de porc) ou pancetta arrotolata affumicata (lard de poitrine roulé et fumé)|150 g de pecorino romano (ou parmesan)|poivre noir au moulin", "Faire cuire les pâtes al dente, dans une grande casserole d’eau bouillante salée, le temps indiqué sur le paquet, à bouillons continus.|Pendant ce temps, casser les œufs dans un bol en ne gardant que les jaunes. Ajouter le parmesan fraîchement râpé, poivrer. Battre le tout à la fourchette jusqu’à ce que la sauce soit crémeuse, presque mousseuse.|Débarrasser le porc de sa peau et le tailler en dès de 1 cm de côté. Faire revenir à la poêle, sans ajouter de matière grasse. Quand ils sont bien colorés, éteindre le feu et enlever la graisse.|Une fois cuites, égoutter les pâtes rapidement, mais pas trop : il faut toujours garder un peu d’eau pour les pâtes en sauce, l’équivalent de 2 cuillerées. Verser aussitôt les pâtes dans un saladier, avec les œufs battus et remuer sans arrêt pendant une minute, pour bien enrober les pâtes : les œufs vont cuire un peu au contact des pâtes chaudes et la préparation ne doit pas s’assécher. Ajouter le porc doré. Mélanger délicatement.|Servir aussitôt, dans des assiettes creuses, avec un peu de parmesan supplémentaire et un tour de moulin à poivre.", '', '', TRUE),
  (NULL, '', '', '', "Pilaf express au chorizo", "Un plat unique, très simple, facile à préparer pour les grandes tablées.", 15, 0, 30, "4 kg de riz rond à paëlla ou à risotto|2 kg de saucissons de chorizo doux|2 kg de carottes|10 oignons|10 cubes de bouillon déshydraté de volaille|eau chaude", "Couper le chorizo en rondelles. Le faire suer doucement au fond de la marmite, sans ajouter de matière grasse : le chorizo va rendre son gras, inutile d’en ajouter ! Il ne doit pas noircir.|Peler et émincer les oignons. Les faire revenir avec le chorizo, jusqu’à ce qu’ils soient translucides.|Ajouter le riz. Remuer quelques instants, pour enrober tous les grains. Quand ils commencent à devenir translucides, ajouter le bouillon, préalablement délayé dans un bol d’eau chaude.|Éplucher les carottes et les couper en rondelles, pas trop épaisses. Les ajouter. Mélanger. Couvrir et laisser cuire à feu doux.|Le tout doit prendre la belle couleur orangée du chorizo.", '', '', FALSE),
  (NULL, '', '', '', "Gâteau à la banane et pépites de chocolat (sans lactose)", "", 10, 60, 60, "3 bananes mûres (+ 1 banane pour le décor)|2 œufs|80 g d’huile neutre (pépin de raisin ou n’importe quelle huile désodorisée)|210 g farine|1/2 sachet de levure chimique|1 pincée de sel|50 g cassonade|120 g chocolat noir corsé", "Préchauffer le four à 160°C.|Mixer les 3 bananes avec les œufs et l’huile (ou écraser les bananes à la fourchette et mélanger aux œufs et l’huile).|Ajouter : la farine, la levure chimique, le sel et la cassonade. Mélanger au fouet.|Concasser le chocolat en grosses pépites et les incorporer à la pâte.|Verser la préparation dans un moule à cake.|Trancher dans sa longueur la banane décorative. La disposer joliment sur cake puis enfourner pendant 1h. Vérifiez la cuisson en pointant un couteau dedans : la lame doit ressortir sèche.|Laisser refroidir sur une grille.", '', '', FALSE),
  (NULL, '', '', '', "Tarte aux pommes, pâte levée", "", 60, 0, 30, "125 g de beurre|250 g de farine|1 pincée de sel|15 g de levure de boulanger|5 g de sucre|1 œuf|1 tasse de lait|4 pommes Canada (ou d’autres fruits de saison)", "Diluer la levure avec le lait tiède et le sucre dans une tasse.|Mélanger l’ensemble des ingrédients afin d’obtenir une pâte lisse et souple.|Étaler la pâte dans un grand moule à tarte, préalablement huilé, en l’écrasant avec le plat de la main et en la repoussant progressivement vers le bord.|Placer le moule au-dessus d’une source de chaleur douce (35°C) afin de faire lever la pâte pendant 30 à 45 minutes. La pâte doit avoir doublé de volume.|Couper les pommes en lamelles et les mettre délicatement sur la pâte sans l’écraser.|Faire cuire entre 180 et 200°C pendant 25 à 30 minutes jusqu’à ce que les bords soient dorés.", '', '', FALSE),
  (NULL, '', '', '', "Gâteau de Carême (pitta nistissimi)", "", 15, 0, 45, "3 tasses de farine tout usage|½ tasse de poudre d’amandes|2 c. à café de poudre à lever|1 c. à café de bicarbonate de soude|1 tasse de jus d’orange|zeste d’orange râpé|1 c. à café de cannelle|¼ c. à café de girofle moulue|¾ de tasse d’huile d’olive tiède|1 tasse de sucre|½ tasse de raisins de Corinthe|½ tasse de raisins de Smyrne|½ tasse de noix hachées|½ tasse d’Ouzo (facultatif)|éclaboussure d’eau de rose|sucre glace", "     Diluez le bicarbonate de soude dans le jus d’orange.|Tamisez la farine avec les amandes moulues, le zeste et les épices. Mélangez bien.|Dans un grand bol, battez ensemble l’huile chaude, le sucre et le jus d’orange.|Ajoutez le mélange de farine et mélangez bien.|Ajoutez les fruits secs et les noix hachées, un shot d’Ouzo et une éclaboussure d’eau de rose. Mélangez bien.|Versez la pâte dans un moule huilé et fariné de 22 x 32 cm et cuisez à four moyen pendant 45 minutes.|Laissez refroidir 5 minutes hors du four avant de démouler délicatement. Une fois le gâteau refroidi, transférez dans un plat de service et saupoudrez de sucre glace.", '', '', FALSE),
  (NULL, '', '', '', "Broyé du Poitou", "", 30, 0, 25, "225 g de farine|100 g de sucre|125 g de beurre|8 g de sel|1 jaune d’œuf", "Verser tous les ingrédients dans un grand saladier.|Pétrir à la main jusqu’à obtention d’une pâte lisse.|Étaler la pâte pour obtenir un cercle d’environ un centimètre d’épaisseur.|Dorer (un jaune d’œuf, une pincée de sel, quelques gouttes d’eau tiède) au pinceau.|Décorer en traçant des lignes avec une fourchette.|Faire cuire environ 15 ou 20 minutes à 190°C.|Sortez-le lorsque la couleur (dorée) est à votre goût.", '', '', FALSE),
  (NULL, '', '', '', "Biscuit au miel d’Ostara", "", 15, 0, 45, "100 g de miel|100 g de farine|50 g de beurre|⅔ d’un sachet de levure|1 œuf", "Préchauffer le four à 150°C/300°F.|Beurrer un moule de 22 cm de diamètre. Tapisser de farine.|Mettre à chauffer le miel dans la casserole. Retirer lorsqu’il est tout juste tiède. Mélanger avec le beurre et l’œuf battu.|Mélanger la levure et la farine dans le chaudron.|Verser le mélange de miel, d’œuf et de beurre. Bien mélanger.|Verser la pâte dans le moule.|Enfourner et cuire 45 min.|Attendre 5 min avant de démouler sur une grille.", '', '', TRUE);


/* Fulfill the table opinions */

INSERT INTO opinions (opinion_ID, opinion_user_ID, opinion_recipe_ID, opinion_message, opinion_rate, opinion_is_validated) VALUES
  (NULL, '', '', "Cette recette est extraordinaire", 5, TRUE),
  (NULL, '', '', "Pas mal mais le repas revient cher.", 3, TRUE),
  (NULL, '', '', "Le mélange est immonde, j'ai vomi!!", 1, FALSE);

/* Fulfill the tables - END */