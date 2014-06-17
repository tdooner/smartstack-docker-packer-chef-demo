#!/bin/bash -el

echo "Running app server..."
docker run \
  --publish 4567 \
  --publish 3181 \
  --link zookeeper:zookeeper \
  -i -t \
  ted27/packer-app:0.1 \
  /sbin/my_init --enable-insecure-key -- /bin/bash #ruby /home/tom/app.rb -p 4567 -o 0.0.0.0
