# Bootcamp homework - docker

A task is:   
Run 2 Alpine based containers in non-default bridge network. 
These containers should have 2 netcat scripts: one for client another for server. 
Scripts should be available inside docker containers through bind points 
and should be located in the directory from which containers are started. 
In result data should be transmitted from one container to another one.

## Run

    [sudo] ./run.sh
is a script creating images from dockerfiles then network then containers from those images
and connecting these containers to the network 
then running them and copying data from server container to an output file.

    [sudo] ./run.sh clean
deletes everything created by previous command.

## files

    client/scripts
contains scripts for the client container.

    client/data/data-example.text
contains the data which has to be transmitted from client container to server.

    client/Dockerfile
    server/Dockerfile
are client and server dockerfiles.

    server/scripts
contains scripts for the server container.

    run.sh
is the script which does all work.

    out/out.text
is creating when run.sh is running.

