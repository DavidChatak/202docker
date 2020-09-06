#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo wget https://raw.githubusercontent.com/DavidChatak/202docker/master/bookstore-api.py -P /home/ec2-user
sudo wget https://raw.githubusercontent.com/DavidChatak/202docker/master/docker-compose.yaml  -P /home/ec2-user
sudo wget https://raw.githubusercontent.com/DavidChatak/202docker/master/Dockerfile -P /home/ec2-user
sudo wget https://raw.githubusercontent.com/DavidChatak/202docker/master/build-script.sh -P /home/ec2-user
docker build -t davidchatak/bookstore-api:latest .
docker-compose up
