# Allgemeine Docker Befehle

## Gegebenenfalls docker (neu) starten
* **sudo service docker stop**			  # Docker service stoppen
* **sudo service docker start**		  # Docker service starten


## Nginx image suchen und herunterladen
* **docker search nginx**				  # Sucht image mit dem namen
* **docker pull nginx** 					  # Lädt image herunter


## Alle images auflisten
* **docker images** 						    # listet verfügbare images auf


## Neuen container mit image erstellen
* **docker run -d --name HEINZ --rm nginx:latest**				        # Container mit image nginx im Hintergrund erstellen
* **docker run -it --name Kurt --rm alpine:latest /bin/sh** 			  # Container mit image alpine im Vordergrund erstellen

parameter:
* **-d** 					          # Container im Hintergrund erstellen
* **-it und /bin/sh**		    # Container im Vordergrund erstellen (interaktiv) mit shell
* **--rm** 					        # Conatiner nach gebrauch löschen
* **--name [name]**			    # Name des containers

## Alle laufenden container anzeigen
* **docker ps**							  # zeigt alle lazfenden instanzen


## Eigenschaften von vorhandenem Container anzeigen 		
* **docker inspect [id|name]**			# zeigt alle Daten des Containers


## Container testen
* **curl [IpAdresse]**					    # gibt des HTML code der Webseite zurück


## Neues image aus container erstellen
* **docker commit [NameContainer|IdContainer] [NameImage]**

# Tar image zu images hinzufügen
* **sudo docker load < [NameImage].tar**


# Umwandeln der Django App in Microservices

## Mysql als Microservice bereitstellen

### Mysql image herunterladen
* **docker search mysql --filter "is-official=true"**		    # offizielles mysql image suchen
* **docker pull mysql**  									                  # mysql image herunterladen

### Mysql container starten
* **docker run --name mysql_test -e MYSQL_ROOT_PASSWORD=admin123 -d mysql:latest**

parameter: 
* **mysql_test** 		# name der instanz
* **admin123**			# passwort der db
* **latest**			# tag, welche db version benutzt werden soll

### Mysql Datenbankverbindung herstellen
* **docker run -it --rm mysql mysql -h172.17.0.2 -uroot -p**

parameter:
* **-it** 				# Im Vordergrund
* **--rm**				# Nach benutzung löschen
* **-h[IpAdresse]**		# Ip Adresse des db containers
* **-uroot**			# Mit rootzugriff

### Auf Datenbank zugreifen
* **show databases;**		        # Alle Datenbanken anzeigen
* **connect [DbName];**	        # Auf Datenbank zugreifen
* **show tables;**		          # Alle Tabellen anzeigen


## Django App für mysql konfigurieren und Migration der Datenbank

### Pakete installieren
* **apt-get install docker**
* **apt-get install python3-dev**
* **apt-get install python3-dev libmysqlclient-dev**
* **pip3 install mysqlclient**
* **apt-get install mysql-server**

### Mysql container starten
* **docker run --name mysql_test -e MYSQL_ROOT_PASSWORD=admin123 -d mysql_image:latest**

parameter: 
* **mysql_test** 		# name der instanz
* **admin123**			# passwort der db
* **latest**			  # tag, welche db version benutzt werden soll

### Mysql Datenbank verbindung herstellen
* **docker run -it --rm mysql mysql -h172.17.0.2 -uroot -p**

parameter:
* **-it** 				    # Im Vordergrund
* **--rm**				    # Nach benutzung löschen
* **-h[IpAdresse]**		# Ip Adresse des db containers
* **-uroot**			    # Mit rootzugriff

### Datenbank translate + user anlegen
* **CREATE DATABASE translate CHARACTER SET UTF8;**
* **CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123';**  
* **GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';** 
* **FLUSH PRIVILEGES;**

### Datenbank migrieren
* **sudo python3 manage.py migrate**						# Datenbank migrieren

### Server starten
* **cd /home/ansible/projekt/Translator/translate**		# In ordner navigieren
* **sudo python3 manage.py runserver 0.0.0.0:80**			# Server laufen lassen
