#!/bin/env bash
# This is a shortcut to handle the compose file stuff
COMPOSE_FILE=docker/compose-dev.yml

check_tool() {
  local tool=$1
  if command -v "$tool" &>/dev/null; then
    version=$($tool --version)
    echo "[FOUND] $tool: $version"
    return 0
  else
    echo "[MISSING] $tool is not installed."
    return 1
  fi
}

#Prefer Podman
if check_tool "podman-compose"; then
  echo Using Podman.
  TOOL="podman"
elif check_tool "docker-compose"; then
  TOOL="docker"
  echo Using Docker
else
  echo "Podman and Docker not installed. We need one."
  exit 1
fi

# Add Compose check.
if [[ $1 == "down" ]]; then
  ${TOOL} compose -f ${COMPOSE_FILE} "$1"
  echo "Ideally services are down."
elif [[ $1 == "up" || $1 == "" ]]; then
  ${TOOL} compose -f ${COMPOSE_FILE} up -d
  echo "Services have been started, please check"
else
  ${TOOL} compose -f "${COMPOSE_FILE}" "${1}"
fi
