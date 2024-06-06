# Steps taken to deploy Protainer stack

Based on guide by [Docker Swarm Rocks](https://dockerswarm.rocks/portainer/)

## Prepare environment variables

Get manager node ID

    export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

Create portainer-data tag on manager

    docker node update --label-add portainer.portainer-data=true $NODE_ID

Export base domain

    export BASE_DOMAIN=your.domain.here

## Deploy Portainer

    docker stack deploy -d -c docker-compose.yml portainer
