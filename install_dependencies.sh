#!/bin/bash

# Update the package index
sudo apt-get update

# Install Docker if it's not installed already
if ! command -v docker &> /dev/null
then
    echo "Docker not found, installing..."
    sudo apt-get install -y docker.io
else
    echo "Docker is already installed."
fi

# Start Docker service if it's not running
sudo systemctl start docker
sudo systemctl enable docker
