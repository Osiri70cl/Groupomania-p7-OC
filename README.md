# GROUPOMANIA 

## Quel est ce repository ? 

Vous trouverez ici le code source du dernier projet de ma formation developpeur web chez OpenClassrooms. 

## En quoi consiste ce pojet ? 

Dans ce projet 7, nous devions crééer un réseau social d'entreprise. Nous devions partir from scratch avec comme contrainte d'utliser obligatoirement un framwork frontend (de notre choix). Certaines fonctionnalités nous étaient imposés tels que : 

- Pouvoir cééer, supprimer un compte utilisateur; ainsi que de pouvoir se connecter et se déconnecter. 

- Pouvoir crééer, modifier et suppimer un Post 

- Aimer ou non un post

- Présence d'un compte admin pouvant créer, modifier, supprimer n'importe quel Post et Utilisateur.

- Code couleur imposé

Pour le reste (visuel du projet, et fonctionnalités supplémentaires) nous avions carte blanche. 

## Les technologies

Dans ce projet j'ai utilisé plusieurs technologies. Pour le backend Nodejs, et MYSQL; pour le frontend, Vuejs a été mon framework de prédilection. 


# Comment faire fonctionner le projet :



## Pour le backend suivez ces instructions :

- Placez vous dans le dossier backend
- Initialisez les packages via la commande `npm install`
- Lancez le backend en tapant ensuite `nodemon`
- Vérifiez bien que le backend communique via le port `:3000`

## Mettez en place la base de données de cette manière :

- Connectez vous au serveur MySQL
- Lancez la commande suivante pour créer la base de données : `CREATE DATABASE groupomania_database`
- Vérifiez que vos identifiants de base de données correspondent avec ceux renseignés dans le fichier .env disponible dans le dossier Backend. Dans le cas échéant modifiez les au sein du fichier
- Importez enfin le fichier .sql disponible dans le dossier DB du Backend en tapant la commande suivante : `mysql -u votreidentifiant -p groupomania_database < sauvegarde.sql`

## Pour lancer le frontend :

- Placez vous dans le dossier frontend
- Dans le terminal exécutez la commande `npm install`
- Lancez ensuite la commande `npm run serve`
- L'interface client est disponible à l'URL suivante : http://localhost:8080/

## Enfin vous pouvez accèder à l'application !

- Lancez la via http://localhost:8080/
- Un compte admin est déjà disponible, connectez-vous avec l'identifiant `Admin`et le mot de passe `Admin12345@`
