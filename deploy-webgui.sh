#!/usr/bin/env bash

mkdir -p cdn-files

rm -rff cdn-files/public cdn-files/libs
mkdir -p cdn-files/public

docker run --rm \
  --volume "$PWD/cdn-files:/tmp/cdn-files" \
  --user "$UID" \
  --workdir /usr/local/share/.config/yarn/global/node_modules/shadowsocks-manager/plugins/webgui \
  -it \
  geektr/ssmgr /bin/bash -c \
  "cp -r libs /tmp/cdn-files; cp -r public/views /tmp/cdn-files/public"

ossutil --endpoint="oss-cn-shanghai.aliyuncs.com" cp -rf cdn-files/libs/ oss://deaf-mutes/libs/
ossutil --endpoint="oss-cn-shanghai.aliyuncs.com" cp -rf cdn-files/public/ oss://deaf-mutes/public/
ossutil --endpoint="oss-cn-shanghai.aliyuncs.com" cp -rf conf/ssmgr/skin/laughing-man-rotate.svg oss://deaf-mutes