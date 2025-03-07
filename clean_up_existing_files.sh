#!/bin/bash
set -e  # Exit on any error

CONTAINER_NAME="web-app-container"

echo "Stopping and removing container: $CONTAINER_NAME"

if sudo docker ps -q -f name=$CONTAINER_NAME; then
    echo "Container is running, stopping and removing..."
    sudo docker stop $CONTAINER_NAME || true
    sudo docker rm -f $CONTAINER_NAME || true
else
    echo "No running container found with name: $CONTAINER_NAME"
fi

echo "Cleanup completed."
