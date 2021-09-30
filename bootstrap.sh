#!/usr/bin/env bash

# Add Docker Repo
apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Add Jenkins Repo
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update

# Install Java, Docker and Jenkins
sudo apt install -y default-jre
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y jenkins

systemctl start jenkins

# Apache install
#apt-get install -y apache2
#if ! [ -L /var/www ]; then
#    rm -rf /var/www
#    ln -fs /vagrant /var/www
#fi