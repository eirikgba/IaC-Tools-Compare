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
    <h1>Hello :D This is a website for IaC group 5</h1>
</body>
</html>
" > /home/ubuntu/index.html

sleep 1

# Dockerfile
printf "
FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
" > /home/ubuntu/Dockerfile

sleep 1

# Build and run
sudo docker build -t my-apache2 .
sudo docker run -dit --name my-running-app -p 8080:80 my-apache2

final_message: "Ferdig!!"
echo "Ferdig"
