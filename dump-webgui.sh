#!/usr/bin/env bash

rm -rf webgui
mkdir -p webgui/public

cp conf/ssmgr/skin/laughing-man-rotate.svg webgui

docker run --rm \
  --volume "$PWD/webgui:/tmp/webgui" \
  --user "$UID" \
  --workdir /usr/local/share/.config/yarn/global/node_modules/shadowsocks-manager/plugins/webgui \
  -it \
  geektr/ssmgr /bin/bash -c \
  "cp -r libs /tmp/webgui; cp -r public/views /tmp/webgui/public"
