#!/usr/bin/env bash

set -e

EC2_HOST="$1"
EC2_USER="ubuntu"
APP_DIR="cloud-platform-foundation"

if [ -z "$EC2_HOST" ]; then
  echo "Usage: ./scripts/deploy.sh <ec2-ip>"
  exit 1
fi

echo "Deploying to $EC2_HOST..."

ssh -i ~/.ssh/axel-ec2.pem ${EC2_USER}@${EC2_HOST} << EOF
  set -e

  if [ ! -d "$APP_DIR" ]; then
    echo "Cloning repo..."
    git clone https://github.com/axellindgren/cloud-platform-foundation.git
  fi

cd $APP_DIR
git pull

if [ ! -f ".env" ]; then
  echo "Creating .env file..."
  echo "APP_VERSION=ec2" > .env
fi

docker-compose down
docker-compose up -d --build

  echo "Deploy complete."
EOF
