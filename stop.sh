#!/bin/bash

# Define the services in the order you want them stopped
services=("vsserver" "grafana" "influxdb" "node-exporter" "prometheus" "loki")

# Stop services one by one and wait for them to stop
for service in "${services[@]}"; do
  printf "Stopping $service... \n"
  docker-compose stop "$service"

  # Wait for the service to be completely stopped
  while [ "$(docker ps -q --filter "name=${service}")" ]; do
    printf "Waiting for $service to stop... \033[2K"
    sleep 1
  done

  printf "$service has stopped. \n"
done

printf "All services have been stopped! \n"
