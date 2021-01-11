# Install Tomcat App Server on Worker1 

## Download Tomcat & Install 
```
wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz
tar -zxvf apache-tomcat-8.5.61.tar.gz
mv apache-tomcat-8.5.61 /opt/tomcat

```

## Install Java JDK 
```
apt-get update ; apt-get install default-jdk -y
```

## Start the Tomcat Server.
```
cd /opt/tomcat/bin/
./catalina.sh start
```

<<<<<<< HEAD

## Copy the User & Context File into respective locations
=======
## Copy the User & Context file in respective locations
```
cp -rf tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
cp -rf context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
```

>>>>>>> 43224312a2b5d12339a4e975ab20b3830fc6b1b9
