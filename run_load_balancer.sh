#!/bin/bash -el

echo "Running load balancer..."
docker run \
  --publish 8080 \
  --publish 3181 \
  --detach \
  --link zookeeper:zookeeper \
  ted27/packer-load-balancer:0.1 \
  /sbin/my_init --enable-insecure-key -- \
    unicorn -c /home/tom/unicorn.rb /home/tom/config.ru
