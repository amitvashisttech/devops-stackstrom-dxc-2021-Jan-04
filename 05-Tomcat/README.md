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


## Copy the User & Context File into respective locations
