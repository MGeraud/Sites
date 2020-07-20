# Sites

#### Application web développée dans le cadre du projet 6 du parcours développeur d'application JAVA d'OpenClassRooms.


###### Fonctionnalités

L'objectif est de développer un site communautaire autours de l'escalade, dont les fonctionnalités sont les suivantes :

* F1 : Un utilisateur doit pouvoir consulter les informations des sites
  d’escalades (secteurs, voies, longueurs, etc.).
  
* F2 : Un utilisateur doit pouvoir faire une recherche à l’aide de plusieurs
 critères pour trouver un site de grimpe et consulter le résultat de cette
 recherche. Les critères peuvent être le lieu, la cotation, le nombre de
 secteurs, etc
 
* F3 : Un utilisateur doit pouvoir s’inscrire gratuitement sur le site.

* F4 : Un utilisateur connecté doit pouvoir partager des informations sur un
  site d’escalade (secteurs, voies, longueurs, etc.).
  
* F5 : Un utilisateur connecté doit pouvoir laisser des commentaires sur les
  pages des sites d’escalade.
  
* F6 : Un membre de l'association doit pouvoir taguer un site d’escalade
  enregistré sur la plateforme comme « Officiel Les amis de l’escalade ».
  
* F7 : Un membre de l'association doit pouvoir modifier et supprimer un
  commentaire.
  
* F8 : Un utilisateur connecté doit pouvoir enregistrer dans son espace
personnel les topos qu’ils possèdent et préciser si ces derniers sont
disponibles pour être prêtés ou non.
Un topo est défini par un nom, une description, un lieu et une date de
parution.

* F9 : Un utilisateur connecté doit pouvoir consulter la liste des topos
disponibles par d’autres utilisateurs et faire une demande de réservation.
La réservation n’inclut pas les notions de date de début et date de fin.

* F10 : Un utilisateur connecté doit pouvoir accepter une demande de
réservation. Si une réservation est acceptée, automatiquement le topo
devient indisponible. L’utilisateur connecté pourra ensuite de nouveau
changer le statut du topo en « disponible ».
La plateforme se contente de mettre en contact les deux parties pour le
prêt d’un topo (par échange de coordonnées).

###### Contraintes

* Déploiement sur serveur Apache Tomcat

* SGBD et framework ORM mis en oeuvre

* Gestion des dépendance et package avec Maven

* Application développée en JAVA EE

* Application web responsive


#### Déploiement de l'application

###### Base de données

Pour le développement, l'application a été configurée pour une base de données PostgreSQL.

Vous trouverez sur le site officiel la documentation pour télécharger et installer PostgreSQL : https://www.postgresql.org/

Après avoir créé une base de données et son propriétaire, veuillez modifier le fichier hibernate.cfg.xml avec les informations nécessaire à la connection avec votre base de données
#


Pour profiter des 2 scripts sql ( creation base de données et jeu de données de démonstration(sites et voies en occitanie uniquement) ) avec la configuration pré-rempli dans le code, veuillez :

* créer un rôle nommé admin_escalade en lui donnant les droits de création et gestion de la base de données.
* lui attribuer AdamOndra comme mot de passe
* utiliser les scripts dans postgreSQL
#

###### Packaging en vue du déploiement

Afin de creer une archive WAR pour le déploiement de l'application, veuillez télécharger et installer Maven depuis le site officiel : https://maven.apache.org/

Une fois installé, télécharger le code de l'application (bouton vert noté "Code")

Positionnez vous via le terminal dans le dossier parent de l'application et tapez la commande maven :  mvn package

Dans votre dossier un dossier "target" sera créé à l'intérieur duquel vous trouverez le fichier sites.war

###### Déploiement sur serveur tomcat

Commencez par télécharger et installer le serveur tomcat comme indiqué sur le site officiel : http://tomcat.apache.org/

Une fois installé et démarré , rendez vous sur l'adresse http://localhost:8080/

Puis le bouton "Manager App"
Dans le cadre "Deployer" "Fichier war à déployer" choisissez le fichier sites.war crée par Maven puis choisissez "Deployer" . Vous verrez ainsi l'application /sites dans la liste des applications.

###### Accès à l'application

Pour accèder à l'application : 

* assurez vous que votre base de données est bien en fonction
* démarrer tomcat
* rendez vous sur l'adresse de votre serveur tomcat suivi de /sites/index , donc http://localhost:8080/sites/index si installé en local.
* profitez de la 1ère version de l'application

