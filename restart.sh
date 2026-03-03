#!/bin/bash
# /path/to/restart-containers.sh

# Set error handling
set -e

# set log file and timestamp
LOG_FILE="/var/log/docker-restart.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Docker Compose directory
COMPOSE_DIR="/path/to/docker/compose/file"

# set log function
log() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOG_FILE"
}

log "restarting containers..."

# Enter project directory
cd "$COMPOSE_DIR" || {
    log "error: Cannot change directory to $COMPOSE_DIR"
    exit 1
}

# Restart all services
if docker-compose restart; then
    log "containers restarted successfully"
else
    log "error: failed to restart containers"
    exit 1
fi

# Verify container status
sleep 5
if docker-compose ps | grep -q "Up"; then
    log "All containers are up and running"
else
    log "warning: some containers may not be running properly"
fi

log "restart completed"