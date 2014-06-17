#!/bin/bash -el

echo "Running app server..."
docker run \
  --publish 4567 \
  --publish 3181 \
  --detach \
  --link zookeeper:zookeeper \
  ted27/packer-app:0.1 \
  /sbin/my_init --enable-insecure-key -- \
    unicorn -c /home/tom/unicorn.rb /home/tom/config.ru
