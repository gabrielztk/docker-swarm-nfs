# Steps taken to deploy Adguard stack

## Prepare environment variables

Get manager node ID

    export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

Create manager tag on manager node

    docker node update --label-add manager=true $NODE_ID

Export base domain

    export BASE_DOMAIN=your.domain.here

## Deploy localdns

    docker stack deploy -d -c docker-compose.yml localdns
