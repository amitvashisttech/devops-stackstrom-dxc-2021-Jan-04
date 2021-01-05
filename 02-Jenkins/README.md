# Install CI/CD Tools - Jenkins. 

## Download Jenkins WAR File. 
```
wget https://get.jenkins.io/war-stable/2.263.1/jenkins.war
```

## Jenkins Required Java JDK as dependency. 
```
apt-get update; apt-get install default-jdk -y
java --version 
```

## Start the Jenkins on Port 8081
```
java -jar jenkins.war --httpPort=8081 & 
```
