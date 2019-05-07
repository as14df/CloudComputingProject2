# Get Startet

## Install necessary packages with ansible

1. Clone Project on your local machine

2. Go to /CloudComputing/CloudComputingProject/Automatisierung

3. Open the file hosts

4. Paste the ip adress of your compute engine after [ServerGruppe]  and save the file

5. Open terminal in this folder

6. Type in terminal: ansible-playbook getcurl.yml

7. Wait until ansible finished installation


## Create mysql docker container

8. To connect to the compute engine via ssh, type in terminal: ssh <IP_ADRESS_OF_COMPUTE_ENGINE>

9. To get the ip-adress of the mysql container type in terminal: sudo docker inspect mysql_container

10. Type in terminal: 
      - sudo service docker start			  # start docker service
      - sudo docker pull mysql          # download mysql image
      - sudo docker docker run --name mysql_container -e MYSQL_ROOT_PASSWORD=admin123 -d mysql:latest # create docker container
      
      
## Configure Database

11. Connect to container with database
      - sudo docker inspect mysql_container   # Get ip adres of container
      - sudo docker run -it --rm mysql mysql -h<IP_ADRESS_CONTAINER> -uroot -p  # connect to container database
   
12. Create new database and user
      - CREATE DATABASE translate CHARACTER SET UTF8;   # Create translate database
      - CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123';  # Create user admin
      - GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';   # Grant privileges to admin
      - FLUSH PRIVILEGES;     # Update privileges
      - exit    # exit database

## Change app settings

13. Go to /CloudComputing/CloudComputingProject/Translator/translate/translate, open settings.py and chenge the ip-address of the container with the database
    
14. Go to /CloudComputing/CloudComputingProject/Translator/translate and type in Terminal:
      - Python3 manage.py migrate
      - Python3 manage.py runserver 0.0.0.0:80
      
15. Open your browser and type in: <IP_ADRESS>:80/speaker (for example: http://35.184.11.167:80/speaker/)

// Make sure that in your compute engines settings "Zugriffsbereiche für Cloud API" 
is set to "Uneingeschränkten Zugriff auf alle Cloud-APIs zulassen"
