```bash
# Running this in Amazon Linux 2.0
sudo yum update
sudo yum search docker

sudo yum install docker -y
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Do login in your ECR (assuming you pushed the image to ECR)
aws ecr get-login-password --region *YOUR REGION* | docker login --username AWS --password-stdin *YourECR*

docker pull *YourECR*/minecraft:latest

# Strongly recommend to use EBS, so you can save your data even if EC2 is terminated.
sudo mkdir /data
sudo lsblk -f
sudo mount /dev/xvdb /data # This depends on the EBS Attachment configuration
cd /data

# Run this in the folder you mounted your EBS
docker run -p 25565:25565 -v $(pwd)/world:/minecraft/world --name forge-server *YourECR*/minecraft:latest

```
