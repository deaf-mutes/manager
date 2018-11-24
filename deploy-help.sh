#!/usr/bin/env bash

PROXYCHAIN=
which proxychains && PROXYCHAIN=proxychains
which proxychains4 && PROXYCHAIN=proxychains4

latest_release() {
  $PROXYCHAIN curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

export oss_prefix=https://deaf-mutes.oss-cn-shanghai.aliyuncs.com/help

shitos_ver=$(latest_release shadowsocks/ShadowsocksX-NG | sed 's/v//')
android_ver=$(latest_release shadowsocks/shadowsocks-android | sed 's/v//')
windows_ver=$(latest_release shadowsocks/shadowsocks-windows)

shitos_file_name=ShadowsocksX-NG.app.$shitos_ver.zip
android_arm64_file_name=shadowsocks-arm64-v8a-$android_ver.apk
android_common_file_name=shadowsocks--universal-$android_ver.apk
windows_file_name=Shadowsocks-$windows_ver.zip

shitos_url=https://github.com/shadowsocks/ShadowsocksX-NG/releases/download/v$shitos_ver/ShadowsocksX-NG.app.$shitos_ver.zip
android_arm64_url=https://github.com/shadowsocks/shadowsocks-android/releases/download/v$android_ver/shadowsocks-arm64-v8a-$android_ver.apk
android_common_url=https://github.com/shadowsocks/shadowsocks-android/releases/download/v$android_ver/shadowsocks--universal-$android_ver.apk
windows_url=https://github.com/shadowsocks/shadowsocks-windows/releases/download/$windows_ver/Shadowsocks-$windows_ver.zip

export shitos_cdn_url=$oss_prefix/clients/$shitos_file_name
export android_arm64_cdn_url=$oss_prefix/clients/$android_arm64_file_name
export android_common_cdn_url=$oss_prefix/clients/$android_common_file_name
export windows_cdn_url=$oss_prefix/clients/$windows_file_name


pushd help

mkdir -p build/clients
mkdir -p build/images

pushd build/clients
$PROXYCHAIN wget "$shitos_url"
$PROXYCHAIN wget "$android_arm64_url"
$PROXYCHAIN wget "$android_common_url"
$PROXYCHAIN wget "$windows_url"
popd

$PROXYCHAIN wget -O build/github.css https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css

envsubst < help.md > help.md.mid


tee build/help.html <<EOF
<link rel=stylesheet href=$oss_prefix/github.css>
<div style="max-width: 600px">
$(npx -p markdown md2html help.md.mid)
</div>
EOF

rm help.md.mid

cp images/* build/images/

ossutil --endpoint="oss-cn-shanghai.aliyuncs.com" cp -rf build/ oss://deaf-mutes/help/

popd

echo "MacOS 客户端下载"
echo "<a target=_blank href=$shitos_cdn_url>如果自动下载没有开始，点此下载</a><iframe src=$shitos_cdn_url frameborder=0 height=0></iframe>"
echo "Android 客户端下载 (推荐)"
echo "<a target=_blank href=$android_arm64_cdn_url>如果自动下载没有开始，点此下载</a><iframe src=$android_arm64_cdn_url frameborder=0 height=0></iframe>"
echo "Android 客户端下载 (兼容)"
echo "<a target=_blank href=$android_common_cdn_url>如果自动下载没有开始，点此下载</a><iframe src=$android_common_cdn_url frameborder=0 height=0></iframe>"
echo "Windows 客户端下载"
echo "<a target=_blank href=$windows_cdn_url>如果自动下载没有开始，点此下载</a><iframe src=$windows_cdn_url frameborder=0 height=0></iframe>"
