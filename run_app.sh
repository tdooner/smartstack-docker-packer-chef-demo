#!/bin/bash -el

echo "Running service..."
SERVICE=$(docker run \
  --publish 4567 \
  --detach \
  --link zookeeper:zookeeper \
  ted27/packer-service:0.1 \
  /sbin/my_init --enable-insecure-key -- ruby /home/tom/app.rb -p 4567 -o 0.0.0.0)

echo "Running app server..."
CONTAINER=$(docker run \
  --publish 4567 \
  --detach \
  --link zookeeper:zookeeper \
  ted27/packer-app:0.1 \
  /sbin/my_init --enable-insecure-key -- ruby /home/tom/app.rb -p 4567 -o 0.0.0.0)
