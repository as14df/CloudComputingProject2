# CloudComputingProject

## Get startet manually:

1. Install Virtualenv with Python3, pip3, Gcloud SDK, Google Translate API and Django 

2. Clone Project into Virtualenv

3. Copy Gcloud Jason File to /CloudComputingProject/Translator/UserSpecific

3. Go to Translator and type in Terminal : source env/bin/activate

4. Export Gcloud Jason File by typing following commad :
   export GOOGLE_APPLICATION_CREDENTIALS=YOURFILEPATH/CloudComputingProject/Translator/'YOURFILENAME.json'

// If translating does not work, check if Google translate API is installed and install if necessary:
   pip3 install --upgrade google-cloud-translate
   
   
## Get startet with ansible

1. Clone Project

2. Go to /CloudComputing/CloudComputingProject/Automatisierung

3. Open the file hosts

4. Paste the ip adress of your compute engine after [ServerGruppe]  and save the file

5. Open terminal in this folder

6. Type in terminal: ansible-playbook getcurl.yml

7. Wait until ansible finished installation and close the terminal

8. Open your browser and type in: <IP_ADRESS>:80/speaker (for example: http://35.184.11.167:80/speaker/)

// Make sure that in your compute engines settings "Zugriffsbereiche für Cloud API" 
is set to "Uneingeschränkten Zugriff auf alle Cloud-APIs zulassen"
