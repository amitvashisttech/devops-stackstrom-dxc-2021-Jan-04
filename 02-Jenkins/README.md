# Install CI/CD Tools - Jenkins. 

## Download Jenkins WAR File. 
```
wget https://get.jenkins.io/war-stable/2.263.1/jenkins.war
```

## Jenkins Required Java JDK as dependency. 
```
apt-get update; apt-get install default-jdk -y
java -version 
```

## Start the Jenkins on Port 9090
```
java -jar jenkins.war --httpPort=9090 & 
```

Note: One you go the message on your screen that : "Jenkins is Up & running"

## Access Jenkins from your web browers: "172.31.0.100:9090"
![Optional Text](../Images/01-Jenkins-Install.png)

## Now unlock the Jenkins via initialpassword
```
This may also be found at: /root/.jenkins/secrets/initialAdminPassword
```

## Click on Install Suggested Plugins for further Setup. 
![Optional Text](../Images/02-Install-Plugin.png)
![Optional Text](../Images/03-Install-Plugin-Progress.png)

## Now you can create login access : ( admin/admin ) 
![Optional Text](../Images/04-Create-Admin-User.png)

## Now Jenkins is Ready For User. 
![Optional Text](../Images/05-Jenkins-Ready.png)

## Welcome Login Page.
![Optional Text](../Images/06-Welcome-Page.png)
