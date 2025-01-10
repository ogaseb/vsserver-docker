#!/bin/bash
i=1
sp="\|/-"
services=("loki" "node-exporter" "prometheus" "influxdb" "grafana" "vsserver")

# Start services one by one and wait for them to be healthy
for service in "${services[@]}"; do
  printf "Starting $service... \n"
  docker-compose up -d "$service"

  # Wait for the service to be healthy or running
  while [ "$(docker inspect -f '{{.State.Health.Status}}' $service)" != "healthy" ]; do
    printf "\b%c" "${sp:i++%4:1}"
    sleep 0.1
  done

  printf "\r $service is now healthy. \n"
done

printf "All services have been started! \n"
