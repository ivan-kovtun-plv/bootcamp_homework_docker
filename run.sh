#!/bin/sh

NW="bootcamp-homework-network"
CLIENT_RUN="bootcamp-homework-client-run"
SERVER_RUN="bootcamp-homework-server-run"
CLIENT_IMG="bootcamp-homework-client-img"
SERVER_IMG="bootcamp-homework-server-img"

if [ $1 = "clean" ]; then

    docker container rm -f $CLIENT_RUN
    docker container rm -f $SERVER_RUN

    docker image rm $CLIENT_IMG
    docker image rm $SERVER_IMG

    docker network rm $NW

    rm -rf out

else

    cd client
    docker build . -t $CLIENT_IMG

    cd ../server
    docker build . -t $SERVER_IMG

    docker network create --driver "bridge" --attachable --subnet=192.100.0.0/16 $NW

    docker container create --name $CLIENT_RUN --network $NW --ip 192.100.0.11 $CLIENT_IMG "./start.sh"
    docker container create --name $SERVER_RUN --network $NW --ip 192.100.0.10 $SERVER_IMG "./start.sh"

    docker container start $SERVER_RUN
    docker container start $CLIENT_RUN

    sleep 1s

    cd ..
    mkdir -p out
    docker container cp $SERVER_RUN:/data/out.text out/out.text

fi

