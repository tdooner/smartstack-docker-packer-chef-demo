#!/bin/bash -el

CONTAINER=$(docker run \
              --publish 2181 \
              --detach \
              ted27/packer-zookeeper:0.1 \
              bash /opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start-foreground)

echo $(docker port $CONTAINER 2181)
