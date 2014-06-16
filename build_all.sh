#!/bin/bash -el

FILE_PATH=$(dirname $0)
export PACKER_LOG=true
export PACKER_LOG_PATH=./packer.log

pushd $FILE_PATH/chef
rm -rf ./site-cookbooks || true
berks vendor ./site-cookbooks
popd

packer build $FILE_PATH/packer/zookeeper.json
packer build $FILE_PATH/packer/app_role.json
packer build $FILE_PATH/packer/service_role.json
