#!/bin/bash -el

FILE_PATH=$(dirname $0)

pushd $FILE_PATH/chef
rm -rf ./site-cookbooks || true
berks vendor ./site-cookbooks
popd

packer build $FILE_PATH/packer/packer.json
