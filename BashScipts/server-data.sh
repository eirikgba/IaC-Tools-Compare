#!/bin/bash

# Installer Apache med en enkel webside

# Docker install
sudo apt-get update;

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Webside
# HTML
printf "
<html>
<head>
    <title>IaC Project</title>
</head>
<body>
    <h1>Hello :D This is a website</h1>
</body>
</html>
" > /home/ubuntu/index.html

sleep 1

# Dockerfile
printf "
FROM ubuntu:20.04
MAINTAINER hei ja
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install apache2
EXPOSE 80
" > /home/ubuntu/Dockerfile

sleep 1

# Build and run
sudo docker build -t website:v1 /home/ubuntu/
sudo docker run -dit --name website -p 8080:80 website:v1

final_message: "Ferdig!!"
echo "Ferdig"
