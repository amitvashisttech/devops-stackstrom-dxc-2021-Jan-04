# Base Image.
FROM centos:7

# Maintainer 
MAINTAINER Amit Vashist <amitvashist7@outlook.com>

# Install Apache Packages
RUN yum install httpd -y

# State the Service
CMD ["/usr/sbin/httpd", "-k", "start"] 
