# ECF Entretien sur le site diététicienne de Sandrine COUPART

## Résumé du projet:
Dans cette ECF entrainement il m’a été demandé de mettre en place une application WEB et Web Mobile pour une nutritionniste.

J’ai commencé par mettre en place ma charte graphique, et ma maquette avec Figma.
Ce qui ma permis de travaillé sur la première compétence du projet. 

En parallèle j’ai travaillé sur la méthode merise pour ma conception de donné. Ce qui ma permis d’identifier rapidement les différentes entité et leur relation.

En ce qui concerne le code j’ai utilisé VSCODE , avec comme Framework Front Bootstrap pour l’usage du responsive, de personnalisation et des différentes fonctionnalité des codes.

Pour la partie Back, mon choix s’est porté sur le Framework Symfony qui propose un gain de temps  non négligeable pour la conception. Surtout grâce, doctrine , easy-admin et d’autre bundle très utiles.

L’ensemble de la conception de mes codes m'a permis de mettre en place mes 8 compétences en oeuvre.
 

## Prérequis
* HTML 5
* CSS 3 (Bootstrap 5)
* PHP 8.3
* Symfony 6
* MySQL

## Installation en local:
### Sur un terminal de commandes :
1- Téléchargement et installation du projet

- Pour commencé il sera nécéssaire de clone mon projet.

```bash
git clone [https://github.com/Souley20/sandrineCoupart]
```
- Une foi le pojet cloné, nous pouvons téléchargés le zip dans code -> download ZIP sur la machine locale.
```bash
composer install
```
2- Mise en place de la  BDD.
Le site utilisant symfony CLI, il sera nécéssaire de configuré en local le fichiez .env avec notre localhost.

Paramétrer votre base de données :
Lancer votre gestionnaire de base de données mysql, renseigner le mots de passe, le port, et nommer votre base de donnée : « garageParrot ».

`DATABASE_URL="mysql://root:mon-pass@127.0.0.1:3307/sandrineCoupart?`

Retourner dans votre terminal vsc une fois la base de donnes paramétrer et lancer la commande suivante pour migrer votre base de données :

`php bin/console doctrine:migrations:migrate`


## Installer votre docker :
Installer docker avec la doc suivante selon votre système d’exploitation : https://docs.docker.com/desktop/

Installer le plug in docker sur votre IDE :
Retourner sur votre projet ouvrer extension télécharger le plug in docker, une fois telecharger aller sur votre terminal de commande et taper la commande suivante en ayant votre docker installer au préalable :

`docker run ngnix`

## Charger les fixtures du projet :
Taper la commande suivante dans le terminal de votre projet ! Attention les compte doivent être paramétrés pour accéder a l’admin ! :

`php bin/console doctrine:fixtures:load`

## Démarrer votre server en local :
Taper la commande suivante dans le terminal de votre projet pour lancer votre server en local :

`symfony server:start -d

Enfin pour accéder au site cliquer sur votre lien http://127.0.0.1:8000 ou http://127.0.0.1:8080 dans le rectangle vert de votre terminal

# Création d'un compte administrateur en local :

## Création d’un nouvelle utilisateur :
Pour créer un nouvel administrateur rendez vous dans src/dataFixtures/UsersFixtures.php de votre projet, choisissez un "username" et un
"password". Pour les roles, entrez le role définie sur la copie rendu à cette effet.
Une fois le compte administrateur créé, réutiliser la commande suivante :

`php bin/console doctrine:fixtures:load`

## Connexion au back office :

Cliquez sur connexion en haut à droite de le navbar. Entrez le nom d'utilisateur et le mot de passe.
Félicitation ! Vous êtes maintenant connecté en tant qu'administrateur et vous pouvez maintenant gérer :

## Projet non déployé en ligne.
