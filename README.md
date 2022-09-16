#### Pour le backend suivez ces instructions :

- Placez vous dans le dossier backend
- Initialisez les packages via la commande `npm install`
- Lancez le backend en tapant ensuite `nodemon`
- Vérifiez bien que le backend communique via le port `:3000`

#### Mettez en place la base de données de cette manière :

- Connectez vous au serveur MySQL
- Lancez la commande suivante pour créer la base de données : `CREATE DATABASE groupomania`
- Vérifiez que vos identifiants de base de données correspondent avec ceux renseignés dans le fichier .env disponible dans le dossier Backend. Dans le cas échéant modifiez les au sein du fichier
- Importez enfin le fichier .sql disponible dans le dossier DB du Backend en tapant la commande suivante : `mysql -u votreidentifiant -p groupomania < sauvegarde.sql`

#### Pour lancer le frontend :

- Placez vous dans le dossier frontend
- Dans le terminal exécutez la commande `npm install`
- Lancez ensuite la commande `npm run serve`
- L'interface client est disponible à l'URL suivante : http://localhost:8080/

#### Enfin vous pouvez accèder à l'application !

- Lancez la via http://localhost:8080/
- Un compte admin est déjà disponible, connectez-vous avec l'identifiant `Admin`et le mot de passe `Admin12345@`
