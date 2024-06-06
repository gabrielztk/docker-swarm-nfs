# Steps taken to deploy NFS test stack

This is an example stack with it's volume mounted on an nfs share

## Prepare environment variables

Export nfs server ip

    export NFS_IP=server.ip

Export share path on nfs server

    export NFS_SHARE_PATH=path/on/server

## Make sure the full path exixts

Mount the nfs share on your local machine if you do not have direct access to the nfs server

    sudo apt install nfs-common
    sudo mount -t nfs $NFS_IP:$NFS_SHARE_PATH $LOCAL_MOUNT_PATH

Make any directories and sub-directories that will be needed for each individual volume from the share root.

    mkdir -p $LOCAL_MOUNT_PATH/path/to/volume/

## Deploy NFS test

    docker stack deploy -d -c docker-compose.yml nfs_test
