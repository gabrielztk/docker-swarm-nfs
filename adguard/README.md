# Steps taken to deploy Adguard stack

## Prepare environment variables

Get manager node ID

    export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

Create manager tag on manager node

    docker node update --label-add manager=true $NODE_ID

Export base domain

    export BASE_DOMAIN=your.domain.here

Export you username for the UI

    export USERNAME=admin

Export you password interactively

    export HASHED_PASSWORD=$(openssl passwd -apr1)

## Deploy localdns

    docker stack deploy -c docker-compose.yml localdns
