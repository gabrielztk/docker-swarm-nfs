#!/usr/bin/env bash

STACK_LIST="adguard portainer shepherd traefik wallos flame homebox romm swarm-dashboard swarmpit homepage"

# Remove stacks for backup
for f in $STACK_LIST ; do [ -d "$f" ] && docker stack rm $f ; done

sleep 5

# Do backup

sleep 5

# Recreate stacks after backup
for f in $STACK_LIST ; do [ -d "$f" ] && docker stack deploy -d -c $f/docker-compose.yml $f ; done
