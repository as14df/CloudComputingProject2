###################################################################################
# Voraussetzungen für die Entwicklung mit Django schaffen

# Die Python Installation prüfen 
# https://askubuntu.com/questions/320996/how-to-make-python-program-command-execute-python-3
python -V
python3 -V
which python
which python3

# Für die Installation von Cloud Paketen benötigen wir den Python Paketinstaller
# Installieren!
sudo apt-get install -y python3-pip

# Sinnvoll ist auf jeden Fall auch die Nutzung von virtualenv
# Installieren! 
sudo apt-get install python3-venv 

# Jetzt legen wir ein Projekt mit einem virtual Environment an 
# s.a. https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04
mkdir projekt
cd projekt

# Initalisiere Virtualenv für python 3 im Projektverzeichnis als Unterverzeichnis 'venv3'
virtualenv --python=python3.5 venv3

# Arbeiten mit virtualenv besteht immer aus drei Schritten

# 1. venv Aktivieren 
. venv3/bin/activate

# 2. Arbeiten ....
# Alles was jetzt installliert wird landet automatisch projekt/venv3
# Beispiel: aktualisieren Sie den Pythom Paketmanager upgrade pip3
pip install --upgrade pip
# Install Djangodjango-crispy-forms

# 3. Deaktivieren
deactivate

###################################################################################
# Django einrichten 
# INNERHALB VON VIRTUALENV!!!!! ) also vorher
# cd projekt
# . venv3/bin/activate 
pip install Django==2.1.5

###################################################################################
# Arbeiten mit Django
# Die nächsten Schritte orientieren Sich an 
# "Writing your first Django App"  aus   https://docs.djangoproject.com/en/2.1/intro/
#  Teil 1,2

# Projekt anlegen
django-admin startproject translate

# App Anlegen (django app - 1)
python manage.py startapp speaker 

# HelloWorld in speaker/views.py eingetragen
# urlpattern in speake/urls.py 
# include in translate/urls.py

##################################################################################
# So können Sie Ihre App starten 
# test
python manage.py runserver                 # nur localhost
python manage.py runserver 0.0.0.0:8000    # für alle Interfaces

# ... und auf der Kommandozeile abrufen
curl localhost:8000/speaker/

#=============================================================
# siehe "Writing your first Django App"  Teil 2
# Generate Database
python manage.py migrate

# TODO !!!!!!!!!!!!!!
# Legen Sie ein Datenbankmodell an 
subl speaker/models.py

# Die Daenbankmodelle können Sie später (s.u.) mit dem Admin INterface über die Admin GUI überprüfen

# Passen Sie die settings und ergänzen Sie die Speaker App zu den Installierten Apps
subl translate/settings.py

# weiteres Vorgehen wie in 
python manage.py makemigrations speaker

# SQL Script erzeugen, basierend auf Datenbank
python manage.py sqlmigrate speaker 0001

# Erzeugt folgende Ausgabe
#--
#-- Create model dict_ge_en
#--
#CREATE TABLE "speaker_dict_ge_en" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "key_for_ge_phrase" varchar(20) NOT NULL, "key_for_en_phrase" varchar(20) NOT NULL, "ge_phrase" varchar(100) NOT NULL, "en_phrase" varchar(100) NOT NULL);
#COMMIT;

# Erzeugen des Schemas in der Datenbank
python manage.py migrate

# Legen Sie den Admin an
python manage.py createsuperuser
# UN, PW, EMAIL angeben

# Test der Admin Seite mit Login
firefox localhost:8000/admin/

# Registrieren Sie die App für den Admin in speaker/admin.py und ergänzen 

#=============================================================
# Siehe "Writing your first Django App"  Teil 3

# Legen Sie die Views an 
# es reicht ein einfacher View mit Rückgabe einer Webseite 
# Sie müssen i views.py eine Methode schreiben, die ein Template rendert
# Dazu benötigen Sie ein html template unter speaker/templates 
# TEMPLATES sind bereits vorhanden 
subl speaker/views.py

# Bilden Sie das Template auf den view ab -> Eintrag in urls.py
subl speaker/urls.py

# Ein Index File müssen Sie nicth anlegen, IST in der Vorlage :-) 
subl speaker/templates/speaker/index.html

#=============================================================
# Siehe "Writing your first Django App"  Teil 4

# Die Form Klasse schreiben, die den HTML Code für das Form Feld erzeugt
subl speaker/forms.py

#=============================================================
# Django-app - 6
# CSS erzeugen lassen:   https://html-css-js.com/css/generator/background/
# Verarbeitugng statischer Files: https://docs.djangoproject.com/en/2.1/howto/static-files/

# Hintergrund Image angelegt
# css File angelegt


#=============================================================
# Google-Cloud Tools
# Installiern der SDK
# -> versioniertes Archivs der Google Cloud SDK 
# siehe https://cloud.google.com/sdk/downloads#versioned

# Python Beispiele von Git Clonen 
git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git

# Python- client für translate installieren, die aktuellste Version steht im requirements file
# in den python-docs-samples
pip install google-cloud-translate==1.3.1

# API Schlüssel erzeugen und ins .ssh Verzeichnis legen 
# 1. Projekt auswählen 
# 2. Rechnungskonto für Projekt aktivieren
# 3. in der Google Console: API und Dienste -> Dashboard
#    Tranlation API aktivieren, Dienstkonto festlegen (hier kann man das compute engine Dienstkonto wählen)
#    und Download der Anmeldedaten als JSON -> in .ssh als Env Variable exportieren
#    siehe gcloud-tasks.pdf 
export GOOGLE_APPLICATION_CREDENTIALS=/home/ansible/.ssh/demo-google-cloud-fa1edc37704f.json

#    (dienstkonto notwendig)
# App erweitert
#       UserStory für die App, Entwicklung der Basisfunktionen
#       GUI entsprechend erweitert, Google-cloud-translate SDK integriert
#       Html Template erweitert, Ausgabe eingebaut
#       Besseres Aussehen (CSS)
#       Datenbankbabfrage und Eintrag ergänzt

