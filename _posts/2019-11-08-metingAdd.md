---
layout:     post
title:      "利用Meting实现网页内插入音乐播放器"
subtitle:   "\"我就这么一试，还真就成了。\""
date:       2019-11-08 23:43:23
author:     "子川"
header-img: "img/bg-idea.jpg"
catalog: true
Meting: true
mserver: "netease"
mtype: "playlist"
mid: "39498226"
murl:
mautoplay: true
mtheme: "#f43e06"
tags:
    - 生活
    - 计算机
    - 记录
    - 博客建设
    - 前端
    - JavaScript
---
>一直想在博客里插入自己喜欢的音乐，试了各种方法，最终Meting解决得还不错。简单说说。

## 0. 前言

一开始我用的是网易云的外链播放，实际上网易云的外链播放器做得已经很不错了：

![外链.png](https://i.loli.net/2019/11/08/wKdgEzr5lNRhBys.png)

它支持对播放器样式的简单定制，支持自动播放，但它有点很大的问题：

**VIP相关的音乐不允许外链**，

是的，网易云的版权政策全面收紧，现在沾了VIP————无论是VIP限定还是VIP下载，都不允许外链。

那它有多少VIP限定的音乐呢？

**接近70%**

而且，现在不支持歌单外链，简单地说，网易云现在相当于废了。

既然如此，就得另取他山之石了。

## 1. QQ音乐外链

[Duter2016](https://github.com/Duter2016)大佬给了我一个建议：

![优源.png](https://i.loli.net/2019/11/08/a4GIPRXKzoJqLfd.png)

我照他的指导做了一下，但我能力实在不行，没成功……

这时我的目标就只有图上提到过Aplyer了，而最后Aplayer也的确实现了我的要求，不过也没那么简单。

## 2.Aplayer结合Meting

[Aplayer](https://github.com/MoePlayer/APlayer)是[MoePlayer](https://github.com/MoePlayer)开发的网页音乐播放开源插件，通过它可以简单地实现在网页中插入音乐播放器的操作。

不过问题来了，`Aplayer`自定义的要求太多，音乐信息、歌单、歌曲封面、甚至歌词都要自己设置；而且只能播放包含音乐文件的链接，这就很难提取音乐链接通过提取音乐id内化到`jekyll`的`post`文件头里。

这就很尴尬了，插入了播放器也没歌听，更何况一个歌单几百首歌，难道要一个一个录入么？

这时候就需要一个东西，连接音乐提供商和播放器，让使用者可以简单优雅地将音乐服务器上的内容引导到播放器上，那么有没有这样的东西呢？

当然有了。

[Meting](https://github.com/metowolf/Meting)和[MetingJS](https://github.com/metowolf/MetingJS)就专为连接音乐平台和播放器而设计，只要简单的部署，就可以实现复杂的操作。

## 3. MetingJS的部署


**2019-11-09 18:51:12加入更新：评论区Duter菊苣将三个文件里的代码合并到一个文件，可以有效节省访问时间**

### 3.1 基础部件的引入

复制代码：

```JavaScript
<!-- require APlayer -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
<script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
```

到`head.html`文件。

复制代码：

```JavaScript
<!-- require MetingJS -->
<script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
```

到`footer.html`文件。

### 3.2 播放器模块引入

之后在`_include`文件夹里建一个`Music.html`的文件，这个名字无所谓，不过注意一定要和后面的文件名保持一致。

将

```JavaScript
{% raw %}
<meting-js
    server = {{page.server}}
    autoplay={{page.autoplay}}
	type= {{page.type}}
    id={{page.id}}
    auto={{page.url}}
    theme={{page.theme}}
    >
</meting-js>
{% endraw %}
```

粘贴进文件，然后在`_layouts`文件夹里的`post.html`文件中，找到：

```javascript
<!-- Post Container -->
            <div class="
                col-lg-8 col-lg-offset-2
                col-md-10 col-md-offset-1
                post-container">

            <!-- 中间一大堆代码 -->
            
```

这个内容，然后在`<!--中间一大堆代码-->`之前这个位置，找出个空来把：

```JavaScript
{% raw %}
<!--meting added -->
               {% if page.Muisc %}
                    {% include Music.html %}
                {% endif %}
{% endraw %}
```

复制进去。这里一定要和前面你在`_include`文件夹里建的文件名保持一致。

**大功告成！**

接下来需要做的就是在每次post的文章文件头加入几行，例如：

```JavaScript
---
Music: true//作为判断是否加入播放器的开关
server: "netease"
type: "playlist"
id: "39498226"
url:
autoplay: true
theme: "#f43e06"
---
```

### 3.4 具体细节

关于文件头增加的变量名，这里参考[Aplayer说明文档](https://aplayer.js.org/#/zh-Hans/)和[MetingJS说明文档](https://github.com/metowolf/MetingJS/blob/master/README.md)

这里把主要变量列作下表，作为以后的参考文档：

| 名称            | 默认值                             | 描述                                                                                                   |
| --------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------ |
| id              | **require**                        | 播放id：song id / playlist id / album id / search keyword                                                      |
| server          | **require**                        | 播放平台：music platform: `netease`, `tencent`, `kugou`, `xiami`, `baidu`                                        |
| type            | **require**                        | 播放类型：`song`, `playlist`, `album`, `search`, `artist`                                                        |
| container       | document.querySelector('.aplayer') | 播放器容器元素                                                                                         |
| fixed           | false                              | 开启吸底模式, [详情](https://aplayer.js.org/#/home?id=fixed-mode)                                      |
| mini            | false                              | 开启迷你模式, [详情](https://aplayer.js.org/#/home?id=mini-mode)                                       |
| autoplay        | false                              | 音频自动播放                                                                                           |
| theme           | '#b7daff'                          | 主题色                                                                                                 |
| loop            | 'all'                              | 音频循环播放, 可选值: 'all', 'one', 'none'                                                             |
| order           | 'list'                             | 音频循环顺序, 可选值: 'list', 'random'                                                                 |
| preload         | 'auto'                             | 预加载，可选值: 'none', 'metadata', 'auto'                                                             |
| volume          | 0.7                                | 默认音量，请注意播放器会记忆用户设置，用户手动设置音量后默认音量即失效                                 |
| audio           | -                                  | 音频信息, 应该是一个对象或对象数组                                                                     |
| audio.name      | -                                  | 音频名称                                                                                               |
| audio.artist    | -                                  | 音频艺术家                                                                                             |
| audio.url       | -                                  | 音频链接                                                                                               |
| audio.cover     | -                                  | 音频封面                                                                                               |
| audio.lrc       | -                                  | [详情](https://aplayer.js.org/#/home?id=lrc)                                                           |
| audio.theme     | -                                  | 切换到此音频时的主题色，比上面的 theme 优先级高                                                        |
| audio.type      | 'auto'                             | 可选值: 'auto', 'hls', 'normal' 或其他自定义类型, [详情](https://aplayer.js.org/#/home?id=mse-support) |
| customAudioType | -                                  | 自定义类型，[详情](https://aplayer.js.org/#/home?id=mse-support)                                       |
| mutex           | true                               | 互斥，阻止多个播放器同时播放，当前播放器播放时暂停其他播放器                                           |
| lrcType         | 0                                  | [详情](https://aplayer.js.org/#/home?id=lrc)                                                           |
| listFolded      | false                              | 列表默认折叠                                                                                           |
| listMaxHeight   | -                                  | 列表最大高度                                                                                           |
| storageName     | 'aplayer-setting'                  | 存储播放器设置的 localStorage key                                                                      |
