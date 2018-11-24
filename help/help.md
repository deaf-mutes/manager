#Shadowsocks 教程
By: GeekTR

文章如有错误请联系我修改：`geektheripper@gmail.com`

***

##1. Windows PC

请不要同时使用 360 和 Shadowsocks，网传 360 会向 gfw 提交用户的翻墙服务器信息以供封禁，360 内存和网络通信加密太狠暂时没找到证据，不过据个人经验判断翻墙服务器被封 和使用 360 的相关性高……

***
访问 GitHub 上 [shadowsocks-windows](https://github.com/shadowsocks/shadowsocks-windows/releases) 主页 的 `releases` 部分，点击选择最新版本右侧的 第一个`.zip`文件开始下载，无法访问或者无法下载时可以使用我准备的链接：

> [Shadowsocks]($windows_cdn_url)

建议去 github 下载使用最新版本。

Shadowsocks 是免安装程序，但是运行时会在当前文件夹生成几个文件，所以最好把 SS 放在一个单独的文件夹，方便管理。

```
|-- 其他文件夹
|-- Shadowsocks
   |-- shadowsocks.exe   //这是 ss 的主文件，以下几个文件在运行时生成
   |-- gui-config.json
   |-- pac.txt
   |-- statistics-config.json
   |-- ...
```

首次运行 Shadowsocks 可能会提示安装 .net Framework 框架，按提示安装后重新运行 Shadowsocks 即可。

首次运行 Shadowsocks 时，如果弹出什么专用网络、公用网络之类的网络权限提示，点确认即可。

首次运行 Shadowsocks 时会弹出这个窗口，这时候就可以把自己的服务器信息填进去了，

> ![ss]($oss_prefix/images/ss1.png)

如果你有二维码形式的 Shadowsocks 配置的话，这一步可以先点取消，看后续教程

SS 运行后会显示在右下角托盘区，右击小飞机图标打开配置选项：

> ![ss]($oss_prefix/images/ss3.jpg)

说明：
> - 0、请勾选此项，除非你使用目标软件的内置 socks 代理。
> - 1、勾选此项后，软件将自动根据目标站点是否被墙而决定是否翻墙访问（勾选`全局模式`的话访问国内网站将非常慢）
> - 2、（截图年份有点久，现在这一项的名字是“分享服务器配置…”）当你需要分享你的翻墙服务器时，请点击此项，屏幕上将显示二维码，这时可以截图或者用手机扫二维码（不过不推荐广泛地分享自己的 SS 服务器）
> - 3、当你获得的翻墙服务器信息是二维码时，请让此二维码显示在屏幕上并点击这个选项，SS 将扫描整个屏幕并识别二维码
> - 4、请勾选此项，PAC 是 SS 判断你所访问的目标网站是否被墙的依据
> - 5、（P 图时不小心多打了一个字，忽略）
> - 6、第一次运行时请点击这一项以更新 PAC 文件，之后偶尔点一下就行了

##2. Linux

***

Linux 用户多半不需要我写教程，鸽了！

##3. MacOS

***

> [Shadowsocks]($shitos_cdn_url)
> Mac 下的 Shadowsocks 与 Windows 相似，可以参考上述 Windows 部分。


##4. 移动设备用户

***

###安卓
首先下载安装这个 app

> [Shadowsocks ARM64]($android_arm64_cdn_url) ARM64 (主流手机都是这个)

> [Shadowsocks Common]($android_common_cdn_url) ARM64 (兼容版本)

软件的使用很简单，填配置和扫码都行。这里单说几个配置选项

>- **路由：**绕过局域网及中国大陆地址
>- **全局代理：**不勾选
>- **分应用代理：**点击进入二级菜单，关闭绕行模式时，只有打勾的 app 翻墙，开启绕行模式时打勾的 app 不翻墙

###iOS

> N+ 年不用 iOS 了，手头没有机器可测，只能提供一些关键字，请通过网络搜索或者群聊解决问题

关键字：`Shadowrocket`，`Wingy`，`iOS 美区`
