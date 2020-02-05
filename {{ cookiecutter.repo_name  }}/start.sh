#!/usr/bin/env bash
export NB_UID=$(id -u)
export NB_GID=$(id -g)
echo "Running docker-compose up -d"
docker-compose up -d