#! /bin/bash
set -e

source .env

yaml_files() {
  yamlfiles="-f docker-compose.yaml"
  for service in "${SERVICES[@]}"; do
    if [ -f "$service/$service.yaml" ]; then
      yamlfiles="$yamlfiles -f $service/$service.yaml"
    fi
  done
  echo "$yamlfiles"
}

case "$1" in
  build )
    folders=(.n8n local-files)
    for folder in "${folders[@]}"; do
      if [ ! -d "$folder" ]; then
        echo "Creating directory: $folder"
        mkdir -p "$folder"
      fi
    done
    eval "docker compose $(yaml_files) build"
    ;;
  "up"|start)
    eval "docker compose $(yaml_files) up -d"
    ;;
  "down"|stop)
    eval "docker compose $(yaml_files) down"
    ;;
  "restart")
    eval "docker compose $(yaml_files) restart"
    ;;
  "logs")
    eval "docker compose $(yaml_files) logs -f"
    ;;
  "export")
    docker exec -it n8n n8n export:credentials --all --output=/files/credentials.json
    docker exec -it n8n n8n export:workflow --all --output=files/workflows.json
    ;;
  "import")
    docker exec -it n8n n8n import:credentials --input=/files/credentials.json
    docker exec -it n8n n8n import:workflow --input=/files/workflows.json
    ;;
  "execute")
    shift
    docker exec n8n n8n execute --id "$@"
    ;;
  *)
    echo "Usage: $0 {up|down|restart|logs|export}"
    exit 1
esac
