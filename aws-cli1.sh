#!/bin/bash
export HOME=/home/ec2-user
rm -rf microservices
git clone https://github.com/sunithat153024/microservices.git microservices 
cd microservices
mvn clean install
echo "build success"
rm -rf /$HOME/aws-cli-out/*.jar
cp -rp /$HOME/microservices/target/*.jar /$HOME/aws-cli-out
aws s3 cp /$HOME/aws-cli-out/*.jar s3://aws30243 --recursive
echo "copied successfully"
