
Attention : tout ceci doit etre lancé avec java 8
-------------------------------------------------

pour lancer saisie
- run.bash 

pour lancer la BD
- cd bd
- ant start // bloque votre terminal
- and db // crée le schéma de la BD
- ant console // crée une console permettant de faire des requêtes SQL
le jar a inclure dans votre projet : hsqldb/lib/hsqldb.jar

pour lancer le web service
- <tomcat-home>/bin/startup.sh
- copier le jar WS.war dans webapps
WSDL a utiliser : http://localhost:8080/WS/services/AccountManager?wsdl
WS ajoute les comptes créés dans /tmp/accounts
