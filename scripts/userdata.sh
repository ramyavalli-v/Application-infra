#!/bin/bash
set -e

yum update -y
yum install -y docker awscli jq
systemctl start docker
systemctl enable docker

# Login to ECR
aws ecr get-login-password --region ap-south-1 \
 | docker login --username AWS \
   --password-stdin ${ECR_IMAGE_URI}

# Fetch DB secret at runtime
SECRET_JSON=$(aws secretsmanager get-secret-value \
  --secret-id preprod/db/credentials \
  --query SecretString \
  --output text)

DB_PASSWORD=$(echo "$SECRET_JSON" | jq -r .password)

# Run application
docker run -d \
  -p 8080:8080 \
  -e DB_HOST=${DB_HOST} \
  -e DB_USER=${DB_USER} \
  -e DB_PASSWORD=$${DB_PASSWORD} \
  ${ECR_IMAGE_URI}:latest