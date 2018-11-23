#!/usr/bin/env bash

rm -rf webgui
mkdir -p webgui/public

docker run --rm \
  --volume "$PWD/webgui:/tmp/webgui" \
  --user "$UID" \
  --workdir /usr/lib/node_modules/shadowsocks-manager/plugins/webgui \
  -it \
  gyteng/ssmgr /bin/bash -c \
  "cp -r libs /tmp/webgui; cp -r public/views /tmp/webgui/public"
