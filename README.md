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
