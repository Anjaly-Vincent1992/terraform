#!/bin/bash
set -e  # Exit on error

CONTAINER_NAME="web-app-container"

echo "Checking for existing container: $CONTAINER_NAME"
if sudo docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Stopping and removing existing container..."
    sudo docker stop $CONTAINER_NAME || true
    sudo docker rm -f $CONTAINER_NAME || true
fi

cd /home/ubuntu/docker-webapp || exit 1  # Ensure correct directory

echo "Building Docker image..."
sudo docker build -t web-app-container .

echo "Starting container..."
sudo docker run -d --name web-app-container web-app-container
