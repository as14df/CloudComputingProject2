# Get Startet

## Install necessary packages with ansible

1. If you don't have ansible already installed, install it first

2. Dowload the subfolder **Automatisierung** under [this link](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/as14df/CloudComputingProject2/tree/master/Automatisierung) and unzip it anywhere on your local machine

3. Open the file **hosts** and paste the ip adress of your compute engine after **[ServerGruppe]**  and save the file

4. Open terminal in this folder and type in it: **ansible-playbook getcurl.yml**

5. Wait until ansible finished the installation


## Create a mysql docker container

8. To connect to the compute engine via ssh, type in terminal: **ssh <IP_ADRESS_OF_COMPUTE_ENGINE>**

9. Type in terminal: 
      - **sudo service docker start**			  # start docker service
      - **sudo docker pull mysql**          # download mysql image
      - **sudo docker run --name mysql_container -e MYSQL_ROOT_PASSWORD=admin123 -d mysql:latest** # create docker container
      
      
## Configure Database

10. Connect to container with database
      - **sudo docker inspect mysql_container**   # Get ip adres of container
      - **sudo docker run -it --rm mysql mysql -h<IP_ADRESS_CONTAINER> -uroot -p**  # connect to container database
   
11. Create new database and user
      - **CREATE DATABASE translate CHARACTER SET UTF8;**   # Create translate database
      - **CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123';**  # Create user admin
      - **GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';**   # Grant privileges to admin
      - **FLUSH PRIVILEGES;**     # Update privileges
      - **exit**    # exit database
      
## Install depedencies

12. Type in terminal:
      - **sudo apt-get install python3-dev libmysqlclient-dev**
      - **pip3 install mysqlclient** 

## Change app settings

13. Go to **/CloudComputing/CloudComputingProject/Translator/translate/translate**, open **settings.py** and change the ip-address of the container with the database
    
14. Go to **/CloudComputing/CloudComputingProject/Translator/translate** and type in Terminal:
      - **Python3 manage.py migrate**
      - **Python3 manage.py runserver 0.0.0.0:80**
      
15. Open your browser and type in: **<IP_ADRESS>:80/speaker** #for example: http://35.184.11.167:80/speaker/

// Make sure that in your compute engines settings "Zugriffsbereiche für Cloud API" 
is set to "Uneingeschränkten Zugriff auf alle Cloud-APIs zulassen"
