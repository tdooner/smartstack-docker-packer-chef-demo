#!/bin/bash -el

echo "Running app server..."
docker run \
  --publish 4567 \
  --publish 3181 \
  --detach \
  --link zookeeper:zookeeper \
  ted27/packer-app:0.1 \
  /sbin/my_init --enable-insecure-key -- ruby /home/tom/app.rb 4567 -o 0.0.0.0
