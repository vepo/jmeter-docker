#!/bin/bash

COUNT=${1-1}

docker build -t jmeter-base jmeter-base
docker-compose build && docker-compose up -d && docker-compose scale master=1 slave=$COUNT

SLAVE_IP=$(docker inspect -f '{{.Name}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep slave | awk -F' ' '{print $2}' | tr '\n' ',' | sed 's/.$//')
WDIR=`docker exec -it master /bin/pwd | tr -d '\r'`
mkdir -p results
for filename in scripts/*.jmx; do
    NAME=$(basename $filename)
    NAME="${NAME%.*}"
    eval "docker cp $filename master:$WDIR/scripts/"
    eval "docker exec -it master /bin/bash -c 'mkdir $NAME && cd $NAME && ../bin/jmeter -n -t ../$filename -R$SLAVE_IP'"
    eval "docker cp master:$WDIR/$NAME results/"
done

docker-compose stop && docker-compose rm -f