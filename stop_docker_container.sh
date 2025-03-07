#!/bin/bash

# Set container name
container_name="project_01"

# Start the logging
echo "Starting the stop_docker_container.sh script..."

# Check if the container is running and stop it
echo "Checking if container $container_name is running..."
container_id=$(docker ps -q -f name=$container_name)

if [ -n "$container_id" ]; then
    echo "Stopping container $container_name..."
    docker stop $container_name
    
    # Optionally remove the container if it's not running anymore
    echo "Removing container $container_name..."
    docker rm $container_name
else
    echo "No container named $container_name is running."
fi

# End of the script
echo "stop_docker_container.sh script completed."
