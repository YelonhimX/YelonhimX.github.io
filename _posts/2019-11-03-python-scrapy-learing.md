---
layout:     post
title:      "Python爬虫学习笔记"
subtitle:   " \"苟日新，又日新，日日新。\""
date:       2019-11-03 18:57:40
author:     "子川"
header-img: "img/post-bg-infinity.jpg"
catalog: true
tags:
    - 爬虫
    - Python
    - 计算机
    - 编程
    - 学习(笔记)
---

# 学习Python爬虫

- [学习Python爬虫](#%e5%ad%a6%e4%b9%a0python%e7%88%ac%e8%99%ab)
  - [1. Requests库使用](#1-requests%e5%ba%93%e4%bd%bf%e7%94%a8)
    - [1.1. 安装requests库](#11-%e5%ae%89%e8%a3%85requests%e5%ba%93)
    - [1.2. 抓取工具的基本代码格式](#12-%e6%8a%93%e5%8f%96%e5%b7%a5%e5%85%b7%e7%9a%84%e5%9f%ba%e6%9c%ac%e4%bb%a3%e7%a0%81%e6%a0%bc%e5%bc%8f)
    - [1.3. Requests.request()方法的参数](#13-requestsrequest%e6%96%b9%e6%b3%95%e7%9a%84%e5%8f%82%e6%95%b0)
    - [1.4. 对于亚马逊等网站审查的应对办法](#14-%e5%af%b9%e4%ba%8e%e4%ba%9a%e9%a9%ac%e9%80%8a%e7%ad%89%e7%bd%91%e7%ab%99%e5%ae%a1%e6%9f%a5%e7%9a%84%e5%ba%94%e5%af%b9%e5%8a%9e%e6%b3%95)
    - [1.5. 添加关键词抓取](#15-%e6%b7%bb%e5%8a%a0%e5%85%b3%e9%94%ae%e8%af%8d%e6%8a%93%e5%8f%96)
    - [1.6. 网络图片的抓取和存储](#16-%e7%bd%91%e7%bb%9c%e5%9b%be%e7%89%87%e7%9a%84%e6%8a%93%e5%8f%96%e5%92%8c%e5%ad%98%e5%82%a8)
  - [2. BeautifulSoup的使用](#2-beautifulsoup%e7%9a%84%e4%bd%bf%e7%94%a8)
    - [2.1. BeautifulSoup的安装](#21-beautifulsoup%e7%9a%84%e5%ae%89%e8%a3%85)
    - [2.2. Suop对象的使用方法](#22-suop%e5%af%b9%e8%b1%a1%e7%9a%84%e4%bd%bf%e7%94%a8%e6%96%b9%e6%b3%95)
    - [2.3. 使用bs4对爬取的Html信息进行优化](#23-%e4%bd%bf%e7%94%a8bs4%e5%af%b9%e7%88%ac%e5%8f%96%e7%9a%84html%e4%bf%a1%e6%81%af%e8%bf%9b%e8%a1%8c%e4%bc%98%e5%8c%96)
    - [2.4. 爬取中国大学排行代码实例](#24-%e7%88%ac%e5%8f%96%e4%b8%ad%e5%9b%bd%e5%a4%a7%e5%ad%a6%e6%8e%92%e8%a1%8c%e4%bb%a3%e7%a0%81%e5%ae%9e%e4%be%8b)
  - [3. 正则表达式和爬虫进阶](#3-%e6%ad%a3%e5%88%99%e8%a1%a8%e8%be%be%e5%bc%8f%e5%92%8c%e7%88%ac%e8%99%ab%e8%bf%9b%e9%98%b6)
    - [3.1. 正则表达式导学](#31-%e6%ad%a3%e5%88%99%e8%a1%a8%e8%be%be%e5%bc%8f%e5%af%bc%e5%ad%a6)
    - [3.2. 正则表达式语法](#32-%e6%ad%a3%e5%88%99%e8%a1%a8%e8%be%be%e5%bc%8f%e8%af%ad%e6%b3%95)
    - [3.3. Re库使用](#33-re%e5%ba%93%e4%bd%bf%e7%94%a8)
    - [3.4. re库中的match对象](#34-re%e5%ba%93%e4%b8%ad%e7%9a%84match%e5%af%b9%e8%b1%a1)
    - [3.5. Match库的贪婪匹配和最小匹配](#35-match%e5%ba%93%e7%9a%84%e8%b4%aa%e5%a9%aa%e5%8c%b9%e9%85%8d%e5%92%8c%e6%9c%80%e5%b0%8f%e5%8c%b9%e9%85%8d)
  - [4. 应用实例————爬取淘宝网商品信息](#4-%e5%ba%94%e7%94%a8%e5%ae%9e%e4%be%8b%e7%88%ac%e5%8f%96%e6%b7%98%e5%ae%9d%e7%bd%91%e5%95%86%e5%93%81%e4%bf%a1%e6%81%af)
    - [4.1. 代码示例](#41-%e4%bb%a3%e7%a0%81%e7%a4%ba%e4%be%8b)
    - [4.2. 对字符串对象的split方法](#42-%e5%af%b9%e5%ad%97%e7%ac%a6%e4%b8%b2%e5%af%b9%e8%b1%a1%e7%9a%84split%e6%96%b9%e6%b3%95)
  - [5. Scrapy爬虫的概念介绍](#5-scrapy%e7%88%ac%e8%99%ab%e7%9a%84%e6%a6%82%e5%bf%b5%e4%bb%8b%e7%bb%8d)
    - [5.1. Scrapy的安装和框架结构](#51-scrapy%e7%9a%84%e5%ae%89%e8%a3%85%e5%92%8c%e6%a1%86%e6%9e%b6%e7%bb%93%e6%9e%84)
    - [5.2. Requests库和Scrapy框架的对比](#52-requests%e5%ba%93%e5%92%8cscrapy%e6%a1%86%e6%9e%b6%e7%9a%84%e5%af%b9%e6%af%94)
    - [5.3. Scrapy爬虫的常用命令](#53-scrapy%e7%88%ac%e8%99%ab%e7%9a%84%e5%b8%b8%e7%94%a8%e5%91%bd%e4%bb%a4)
    - [5.4. Scrapy爬虫的第一个实例](#54-scrapy%e7%88%ac%e8%99%ab%e7%9a%84%e7%ac%ac%e4%b8%80%e4%b8%aa%e5%ae%9e%e4%be%8b)

本文主要内容摘要自公开课[Python网络爬虫与信息提取](http://www.icourse163.org/course/BIT-1001870001?tid=1001962001)，少部分内容来自网络上的其他文章。

## 1. Requests库使用

### 1.1. 安装requests库

以管理员模式运行`cmd`，输入命令：

```cmd
pip install requests
```

等待即可完成安装。

### 1.2. 抓取工具的基本代码格式

```python
import requests
url = "这里输入你要爬取的网址"
try:
    r = requests.get(url)               # get方法爬取
    r.raise_for_status()                # 测验连接是否成功
    r.encoding = r.apparent_encoding    # 转换合适的编码
    print(r.text[:1000])                # 打印爬取结果
except:                                 # 如果出现异常
    print("抓取失败")
```

### 1.3. Requests.request()方法的参数

- **request.get**(**url**, **params = None**, **\*\*kwag**)

    |  参数名  |                  作用                   |
    | :------: | :-------------------------------------: |
    |   url    |           拟获取页面的url链接           |
    |  params  | url中的额外参数，字典或字节流格式，可选 |
    | **kwargs |           12个控制访问的参数            |

- **requests.request**(**method**, **url**, **\*\*kwargs**)

    |  参数名  |               作用                |
    | :------: | :-------------------------------: |
    |  method  | 请求方式，对应get、put、post等7种 |
    |   url    |        拟获取页面的url链接        |
    | **kwargs |        13个控制访问的参数         |

  - **kwargs：控制访问的参数，均为可选项

    - params：字典或字节序列，作为参数增加到url中

        ```python
        url = "http://www.example.com/"
        kv = {'key1':'value1','key2':'value2'}
        r = requests.request('POST',url,params = kv) #等于requests.post(url,params = kv)
        ```

        此时url为：

        ```html
        http://www.example.com/?key1=value1&key2=value2
        ```

    - data：字典、字节序列或文件对象，作为Request的内容

        ```python
        body = 'main content'
        requests.request('POST','url',data = body)
        ```

    - json：JSON格式的数据，作为request的内容

    - headers：字典类型，HTTP定制头，可以进行post和get等操作

    - cookies：字典或`CoolieJar`，request中的cookie

    - auth：元祖类型，支持HTTP认证功能

    - files：字典类型，传输文件

        ```python
        fs = {'file':open('data.xls','rb')}
        r = requests.request('POST',url,files = fs)
        ```

    - timeout：设定超时时间，秒为单位

        ```python
        r = requests.request('GET',url,timeout = 10)
        ```

    - proxies：字典类型，设定访问代理服务器，可以增加登录认证

        ```python
        pxs = {'http':'proxy1'
                    'https':'proxy2'}
        r = requests.request('GET',url,proxies = pxs)
        ```

    - allow_redirects：True/False，默认为True，重定向开关

    - stream：T/F,默认为True，获取内容立即下载开关

    - verify：T/F，默认为True，认证SSL证书开关

    - cert：本地SSL证书路径

### 1.4. 对于亚马逊等网站审查的应对办法

亚马逊等网站通过对`User_Agent`的审查来限制网络爬虫的访问，这时，需要对访问的头文件信息进行修改，伪装成浏览器对网站服务器进行访问。

构造一个键值对：

```python
kv = {'User_Agent' : 'Mozilla/5.0'}
```

在使用`requests.get`函数时，加入如下参数：

```python
python = requests.get("网址", headers = kv)
```

便可正常抓取页面内容。

### 1.5. 添加关键词抓取

例如百度、360等搜索引擎，抓取添加关键词进行搜索后的信息，用到向网页添加内容的`params`参数。

以要搜索`python`为例，

构造键值对：

```python
kv = {'wd':'python' }
#`wd`为搜索引擎关键词索引目录，不同搜索引擎各不相同，这里以百度为例
```

在`get`函数中加入参数`params`

```python
r = requests.get(url, params = kv)
```

获取返回结果长度可以用函数

```python
len(r.text)
```

### 1.6. 网络图片的抓取和存储

完整代码框架如下：

```python
import requests
import os #这里需要额外引入一个os读写库
url  = "www.example.com/xxx.jpg"
root = "D://pics//"#存放图片的地址
path = root + url.split('/')[-1]#路径为根目录//爬取连接的最后一个反斜杠后内                                  容
try:
    if not os.path.exists(root):#如果根目录不存在
        os.mkdir(root)#创建根目录
    if not os.path.exists(path):#如果图片不存在
        r = requests.get(url)#爬取信息
        with open(path,'wb') as f:#用with open将二进制数据转写到图片中
            f.write(r.content)#将图片的二进制内容刻录到图片中

            print("文件保存成功")
    else:
        print("文件已存在")
except:
    print("爬取失败")
```

## 2. BeautifulSoup的使用

### 2.1. BeautifulSoup的安装

`cmd`中输入指令：

```cmd

pip install beautifulsoup4
```

即可安装。

### 2.2. Suop对象的使用方法

- <>.find_all(name,attrs,recursive,string,**kwarg)
  - name:对标签名称的检索字符串
  - attrs:对标签属性值的检索字符串，可标注属性检索
  - recursive:是否对子孙全部检索，默认为True
  - string:<>...</>中字符串区域的检索字符串

### 2.3. 使用bs4对爬取的Html信息进行优化

首先从`bs4`库中引用`BeautifulSoup`类

```python

from bs4 import BeautifulSoup
```

随后

```python

from bs4 import BeautifulSoup
import requests
r = requests.get("http://python123.io/ws/demo.html")#get函数爬取网页数据
demo = r.text#将爬取到的数据赋值到demo
soup = BeautifulSoup(demo,"html.parser")#使用BeautifulSoup函数，后面的html.parser是Html编译器
print(soup.prettify())#调用soup类中的属性将html文本美化
```

### 2.4. 爬取中国大学排行代码实例

```python
import requests
import bs4
from bs4 import BeautifulSoup
import re
'''
模块化编程，编程前先构思程序结构，需要一个爬取数据的函数getHTML()，需要一个将爬取的数据筛选并存放的函数putINList(),
需要一个输出函数printOut()。

'''
def getHTML(url):
    try:
        r = requests.get(url,timeout = 30)
        r.raise_for_status()
        r.encoding = r.apparent_encoding
        return r.text
    except:
        return " "

def putINList(ulist, html):
    soup = BeautifulSoup(html , "html.parser")
    for tr in soup.find('tbody').children:#这里soup.find()函数是搜索Html内容里所有tbody标签下的子标签
        if isinstance(tr,bs4.element.Tag):
            tds = tr('td')
            ulist.append([tds[0].string,tds[1].string,tds[2].string])#对list使用list.append插入元素
'''
    for i in soup.find_all(True):
        print(i.name)               #这段是通过soup.find_all函数查找网页源代码中所有标签并输出
'''

def printOut(ulist,num):
    tplt = "{0:^10}\t{1:{3}^10}\t{2:^10}"#使用format格式化输出，正则表达式限定格式
    print(tplt.format("排名","学校名称","省市",chr(12288)))
    for i in range(num):
        u = ulist[i]
        print(tplt.format(u[0],u[1],u[2],chr(12288)))
def main():

    uinfo = []
    num = input()
    url = "http://www.zuihaodaxue.com/zuihaodaxuepaiming2019.html"
    html =getHTML(url)
    putINList(uinfo,html)
    printOut(uinfo,int(num))
main()
```

## 3. 正则表达式和爬虫进阶

### 3.1. 正则表达式导学

`正则表达式`(Regular Expression、Regex、RE)，是用来简介表达一组字符串的表达式。

```RE
'PN'
'PYN'
'PYTN'                  =               P(Y|YT|YTH|YTHO)?N
'PYTHN'
'PYTHON'
```

- 通用的字符串表达框架

- 简洁表达一组字符串的表达式

- 针对字符串表达“简洁”和“特征”思想的工具

- 用在数据信息处理的字符串匹配中

需要用代码

```python

p = re.comile(regex)
```

编译，即将符合正则表达式语法的字符串转换成正则表达式特征。

### 3.2. 正则表达式语法

>参看
<https://www.jb51.net/tools/zhengze.html>

### 3.3. Re库使用

- Python使用`raw string`类型表达正则表达式，即原生字符串类型。
例如：

```python
r'text'
```

- `string`类型，将`\`理解为转义符，表达更为繁琐。

|     函数      |                              说明                               |
| :-----------: | :-------------------------------------------------------------: |
|  re.search()  |   在一个字符串中搜索匹配正则表达式的第一个位置，返回match对象   |
|  re.match()   |      从一个字符串的开始位置起匹配正则表达式，返回match对象      |
| re.findall()  |           搜索字符串，以列表类型返回全部能匹配的子串            |
|  re.split()   |    讲一个字符串按照正则表达式匹配结果进行分割，返回列表类型     |
| re.finditer() | 搜索字符串，返回一个匹配结果的迭代类型，每个迭代元素是match对象 |
|   re.sub()    | 在一个字符串中替换所有匹配正则表达式的子串，返回替换后的字符串  |

1. re.search(**pattern**,**string**,**flags*- = 0)

    - 在一个字符串中搜索匹配正则表达式的第一个位置，返回match对象。

        - **pattern**：正则表达式的字符串或原生字符串表示

        - **string**：带匹配字符串

        - **flags*- :使用时的控制标记

            |      常用标记      |                               说明                                |
            | :----------------: | :---------------------------------------------------------------: |
            | re.I re.IGNORECASE |           忽略正则表达式的大小写，[A-Z]能够匹配小写字符           |
            |  re.M re.MULTLINE  |     正则表达式中的`^`操作符能够将给定字符串的每行当做匹配开始     |
            |   re.S re.DOTALL   | 正则表达式中的.操作符能够匹配所有字符，默认匹配除换行外的所有字符 |
2. re.match(**pattern**,**string**,**flags = 0**)

3. re.findall(**pattern**,**string**,**flags = 0**)

4. re.split(**pattern**,**string**,**maxsplit = 0**,**flags = 0**)
    - maxsplit是最大分割数，剩余部分作为一个整体最后输出出来

        ```python
        import re

        ls = re.split(r'[1-9]\d{5}','TSU100081 100084BIT ',maxsplit=1):
            print(ls)
        ```

        输出

        ```txt

        ['TSU', ' 100084BIT ']
        ```

        即将匹配到的第一个部分剩余的字符切割出来，而后面的部分作为一个整体输出

5. re.finditer

    ```python
    import re

    for m in re.finditer(r'[1-9]\d{5}','TSU100081 100084BIT '):
        print(m.group(0))

    ```

    输出

    ```markdown
    10081
    10084
    ```

6. re.sub(**pattern**，**repl**,**string**, **count = 0**, **flags=0**)
    - 用新的字符串替换原有正则表达式中的字符串之后返回一个新字符串
        - repl：替换匹配字符串的字符串
        - count: 匹配的最大替换次数

        例如：

        ```python
        import re

        l = re.sub(r'[1-9]\d{5}',' :zipcode', 'BIT100084 TSU100084')
        print(l)
        ```

        输出

        ```markdown
        BIT :zipcode TSU :zipcode
        ```

7. re库的等价用法

    ```python
    import re
    pat = re.compile(r'[1-9]\d{5}')  
    rst = pat.search('BIT 100081')
    #面向对象用法，进行编译以后可以多次操作  
    ```

    - regex = re.compile(**pattern**, **flags = 0**)
        - 将正则表达式的字符串形势编译成正则表达式对象
        - 用法和re库一致

### 3.4. re库中的match对象

1. Match对象的属性

    |  属性   |                 说明                  |
    | :-----: | :-----------------------------------: |
    | .string |             待匹配的文本              |
    |   .re   | 匹配是使用的pattern对象（正则表达式） |
    |  .pos   |     正则表达式搜索文本的开始位置      |
    | .endpos |               结束位置                |

2. Match对象的方法

    |   方法   |               说明               |
    | :------: | :------------------------------: |
    | .group() |        获得匹配后的字符串        |
    | .start() |  匹配字符串原始字符串的开始位置  |
    |  .end()  | 匹配字符串内原始字符串的结束位置 |
    | .span()  |  返回元组类型(.start(),.end())   |

### 3.5. Match库的贪婪匹配和最小匹配

1. Re库默认采用贪婪匹配，即输出匹配最长的子串

    ```python
    match = re.search(r'PY.*N','PYANBNCNDN')
    match.group(0)
    ```

    输出

    ```markdown
    PYANBNCNDN
    ```

2. 如果要得到最小匹配，则需要最小匹配操作符

    | 操作符 |                说明                 |
    | :----: | :---------------------------------: |
    |   *?   | 前一个字符0次或无限次扩展，最小匹配 |
    |   +?   | 前一个字符1次或无限次扩展，最小匹配 |
    |   ??   |       前一个字符0次或1次扩展        |
    | {m,n}? | 扩展前一个字符m至n次(含n)，最小匹配 |

## 4. 应用实例————爬取淘宝网商品信息

### 4.1. 代码示例

```python

import requests
import re
from bs4 import BeautifulSoup
import bs4

def getHTML(url):
    '''
    需要注意的是，淘宝页面爬取需要登录cookies
    以下12行到16行就是编辑cookies的过程
    '''
    kv = {'User_Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36'}
    usercookies = "t=684edbb0ad3447a0b8309bde706ee296; cna=xWPyFVosrVcCAW8oxZC1M8XM; thw=cn; lgc=tb13289283; tracknick=tb13289283; tg=0; mt=ci=0_1; enc=GN0eYRLiSZPf1YYgGyb8Ggz3VzkPmCaiS%2FFLixhxJ%2BMZ8XOES758bNgiDgPK5iURfflbWCxng9xGCeAMKhGmBg%3D%3D; x=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0%26__ll%3D-1%26_ato%3D0; v=0; cookie2=743b5aebbebb887827b23da274a82893; _tb_token_=9ba5e6b78753; unb=3365090684; uc3=id2=UNN79Hu46I5xQA%3D%3D&lg2=U%2BGCWk%2F75gdr5Q%3D%3D&nk2=F5REPQPr65EmWw%3D%3D&vt3=F8dByuHZ7kjZ2ravrg4%3D; csg=d34362a0; cookie17=UNN79Hu46I5xQA%3D%3D; dnk=tb13289283; skt=bb5f94bd37fe92dc; existShop=MTU2OTY5MzUyMQ%3D%3D; uc4=id4=0%40UgQz1yN%2FASfQtG9PoxEcMkmAUfGB&nk4=0%40FY4Pb2hzCHoyQ4FwG2dj1LPTn%2BuX; _cc_=V32FPkk%2Fhw%3D%3D; _l_g_=Ug%3D%3D; sg=34b; _nk_=tb13289283; cookie1=BxUMWqCyesrnB24sCMMgaPAcJDMobZCxwzk2nipIoB4%3D; uc1=cookie16=V32FPkk%2FxXMk5UvIbNtImtMfJQ%3D%3D&cookie21=W5iHLLyFeYZ1WM9hVnmS&cookie15=VFC%2FuZ9ayeYq2g%3D%3D&existShop=false&pas=0&cookie14=UoTaEcfFG6o%2BXQ%3D%3D&tag=8&lng=zh_CN; isg=BJmZudLmIId4X_zwzCi5TqgmqIVzJo3Ymatt-LtOIEA5wrlUA3adqAfQwIa0-iUQ; l=cBSbiUkPqHNT9TbyBOCanurza77OSIRYYuPzaNbMi_5aw6Tsi6QOk6DxIF96VjWd9NTB4tm2-gv9-etkZ8--WOHgcGAN."
    #审查元素——搜索sw.js

    #cookie的处理部分

    cookies = {}
    #服务器要求cookies是字典类型
    #以下是处理cookies文本
    for a in usercookies.split(';'):#以“；”作为划分切割文本
        name,value=a.strip().split('=',1)#split方法可以将等号两遍的字符分割，strip方法可以去除字符串中多余的空格
        cookies[name]=value
    try:
        r = requests.get(url,cookies=cookies,headers=kv,timeout = 30)#request.get方法可以允许携带头文件和cookie访问
        r.raise_for_status
        r.encoding = r.apparent_encoding
        return r.text
    except:
        return False

def editData(plist,html):
    try:
          prt = re.findall(r'"view_price":"\d*\.\d{2}"',html)#正则表达式
          nmt = re.findall(r'"raw_title":".*?"',html)
          for i in range(len(prt)):
              prize = prt[i].split(':')[1].strip("\" ")
              itname = nmt[i].split(':')[1].strip("\"")
              plist.append([prize,itname])
      except:
          return False
  def printOut(plist):
      tplt = '{:8}\t{:16}\t'
      print(tplt.format("价格","商品名"))
      for j in plist:
          print(tplt.format(j[0],j[1]))

  def main():
      turl = "https://s.taobao.com/search?q="
      item = input("请输入你想搜索的物品：")
      depth = input("请输入你想搜索的深度：")
      depth = int(depth)
      cnt = []
      for i in range(depth):
          try:
              url = turl + item + "&s=" + str(44*i)
              html = getHTML(url)
              editData(cnt,html)
          except:
              continue
      printOut(cnt)

  main()

  ```

### 4.2. 对字符串对象的split方法

内容来源[runoob.com](https://www.runoob.com/python3/python3-string-split.html)。

1. 描述

    `split()` 通过指定分隔符对字符串进行切片，如果第二个参数 num 有指定值，则分割为 num+1 个子字符串。
2. 语法

    `split()` 方法语法：

    ```python
        str.split(str="", num=string.count(str))
    ```

3. 参数

    ***str**- -- 分隔符，默认为所有的空字符，包括空格、换行(\n)、制表符(\t)等。

    ***num**- -- 分割次数。默认为 **-1**, 即分隔所有。

4. 返回值

    返回分割后的字符串**列表**。

5. 实例

    以下实例展示了 split() 函数的使用方法：

    ```python
    实例(Python 3.0+)
    #!/usr/bin/python3

    str = "this is string example....wow!!!"
    print (str.split( ))       # 以空格为分隔符
    print (str.split('i',1))   # 以 i 为分隔符
    print (str.split('w'))     # 以 w 为分隔符
    ```

    以上实例输出结果如下：

    ```python
    ['this', 'is', 'string', 'example....wow!!!']
    ['th', 's is string example....wow!!!']
    ['this is string example....', 'o', '!!!']
    ```

    以下实例以`#`号为分隔符，指定第二个参数为`1`，返回两个参数列表。

    ```python
    实例(Python 3.0+)
    #!/usr/bin/python3

    txt = "Google#Runoob#Taobao#Facebook"

    # 第二个参数为 1，返回两个参数列表
    x = txt.split("#", 1)

    print(x)
    ```

    以上实例输出结果如下：

    ```python
    ['Google', 'Runoob#Taobao#Facebook']
    ```

6. 笔记

    URL 简单分割:

    ```python
    #!/usr/bin/python3
    url = "http://www.baidu.com/python/image/123456.jpg"
    #以“.” 进行分隔
    path =url.split(".")
    print(path)
    ```

    以上输出结果：我们在学习 python 爬虫的时候例如需要保存图片，图片名称的获取，可以依照下列方法：

    ```python
    ['http://www', 'baidu', 'com/python/image/123456', 'jpg']
    ```

    以 `/` 进行分隔：

    ```python
    ['http:', '', 'www.baidu.com', 'python', 'image', '123456.jpg']
    ```

    我们在学习 python 爬虫的时候例如需要保存图片，图片名称的获取，可以依照下列方法：

    ```python
    path =url.split("/")[-1]
    ```

    输出结果：

    ```python
    '123456.jpg'
    ```

## 5. Scrapy爬虫的概念介绍

### 5.1. Scrapy的安装和框架结构

1. 安装

    cmd下运行：

    ```pip
    pip install scrapy
    ```

    - 注意Scrapy尽量在虚拟环境中安装，因为Scrapy依靠的Python扩展可能不稳定。或者可以尝试下载`whl`文件手动安装。

2. Scrapy爬虫框架

    - 爬虫框架
        - 爬虫框架是实现爬虫功能的一个软件结构和功能组件集合。
        - 爬虫框架是一个半成品，能够帮助用户实现专业网络爬虫。

    - Scrapy的`5+2`结构

        ![结构图](https://raw.githubusercontent.com/YelonhimX/Code/master/Python/build/drawio_assets/graph.svg?sanitize=true)

        - 5个模块

            - Engine ——已有实现

                - 控制所有模块之间的数据流
                - 根据条件触发事件

            - Spider ——入口，用户编写配置代码

                - 解析Downloader返回的响应
                - 产生爬取项
                - 产生额外的爬取请求

            - Downloader ——已有实现

                - 根据请求下载网页
                - 不需要用户修改

            - Scheduler ——已有实现

                - 对所有爬取请求进行调度管理

            - Item Pipelines ——出口，用户编写配置代码

                - 以流水线待处理Spiders产生的爬取项
                - 由一组操作顺序组成，类似流水线，每个操作是一个Item Pipeline类型
                - 可能操作包括：清理、检验和查重爬取项中的HTML数据、将数据存储到数据库

        - 2个中间键模块

            - Engine ———— Spiders：Spider Middlerware

                **目的**：对请求和爬取项的再处理

                **功能**：修改、丢弃、新增请求或爬取项

                **用户可以配置编写**

            - Engine ———— Downloader：Downloader Middleware

                **目的**：实施Engine、Sheduler、Downloader之间进行用户可配置的控制

                **功能**：修改、丢弃、新增请求或响应

                **用户可以配置代码**

        - 3条数据流

            - 第一条数据流：Spider ——> Engine ——> Sheduler ——> Engine ——> Downloader
                - Spiders产生requests请求，通过Engine模块发送给Sheduler进行调度，而后者将请求发送给Engine，经由中间键发送给Downloader
            - 第二条数据流: Downloader ——> Engine ——> Spiders
                - Downloader连接互联网爬取网页，形成`response`对象响应，通过中间键、Engine发送给Spiders
            - 第三条数据流：Spiders ——> Engine ——> Item Pipelines/Scheduler
                - 经由Spiders处理后产生两个数据类型，一个是爬取项`Items`发送给Item Pipelines，另一个是新的爬取请求`requests`，发送给Sheduler进行调度

### 5.2. Requests库和Scrapy框架的对比

1. 相同点：

    - 两者都额可以进行页面请求和爬取，Python爬虫的两个重要技术路线。
    - 两者可用性都好，文档丰富，入门简单。
    - 两者都没有处理js、提交表单、应对验证码等功能（可扩展）。

2. 区别

    |       **Requests**       |         **Scrapy**         |
    | :----------------------: | :------------------------: |
    |        页面级爬虫        |         网站级爬虫         |
    |          功能库          |            框架            |
    | 并发性考虑不足，性能较差 |     并发性好，性能较高     |
    |     重点在于页面下载     |      重点在于爬虫结构      |
    |         定制灵活         | 一般定制灵活，深度定制困难 |
    |       上手十分简单       |          入门稍难          |

3. 合理选择

    - 非常小的需求，Requests库。
    - 不太小的需求，Scrapy框架。
    - 定制程度很高的需求（不考虑规模），自搭框架，Requests > Scrapy。

### 5.3. Scrapy爬虫的常用命令

- Scrapy命令行

    Scrapy是为持续运行设计的专业爬虫框架，提供操作的Scapy命令行

- 格式

    >scrapy\<command>[options][args]

    Scrapy具体命令在`command`区域体现

- 常用命令

    |     **命令**     |      **说明**      |                  **格式**                   |
    | :--------------: | :----------------: | :-----------------------------------------: |
    | **startproject** |   创建一个新工程   |      scrapy staratproject\<name> [dir]      |
    |  **genspider**   |    创建一个爬虫    | scrapy genspider [options] \<name>\<domain> |
    |     settings     |  获取爬虫配置信息  |          scrapy settings [options]          |
    |    **crawl**     |    运行一个爬虫    |            scrapy crawl\<spider>            |
    |       list       | 列出工程中所有爬虫 |                 scrapy list                 |
    |      shell       | 启动URL调试命令行  |             scrapy shell [url]              |

- Scrapy爬虫的命令行逻辑

    为什么Scrapy采用命令行创建和运行爬虫?

  - 命令行更容易自动化，适合脚本控制

### 5.4. Scrapy爬虫的第一个实例

- 产生步骤

    1. 建立一个爬虫工程

        在Cmd输入：

        >scrapy startproject python123demo

        - 生成的目录

            - python123demo/ ------> 外层目录

                - scrapy.cfg  ---------> **部署**Scrapy爬虫的配置文件
                - python123demo -------> Scrapy框架的用户自定义Python代码

                    - \_\_init\_\_.py -------> 初始化脚本
                    - items.py    -------> Items代码模板（继承类）
                    - middlewares.py-----> Middlewares代码模板（继承类）
                    - pipelines.py ------> Pipelines代码模板（继承类）
                    - settings.py  ------> Scrapy爬虫的配置文件
                    - spiders/     ------> Speders代码模板目录（继承类）

                        - \_\_init\_\_.py ---> 初始文件，无需修改
                        - \_\_pycache\_\_/ --> 缓存目录，无需修改

    2. 在工程中产生一个Scrapy爬虫

        - 运行命令：

        >scrapy genspider demo python123.io

        此命令要求Scrapy生成一个`demo.py`的文件：

        ```python
        # -*- coding: utf-8 -*-
        import scrapy


        class DemoSpider(scrapy.Spider):#必须是继承自Spider的子类
            name = 'demo'#一开始命名的名称
            allowed_domains = ['python123.io']
            start_urls = ['http://python123.io/']#所要爬取也免得初始页面

            def parse(self, response):#解析页面的空方法，解析内容形成字典，产生新的url爬取内容
                pass
        ```

    3. 配置产生的Spider爬虫

        ```python
        # -*- coding: utf-8 -*-
        import scrapy


        class DemoSpider(scrapy.Spider):
            name = 'demo'
            #allowed_domains = ['python123.io']
            start_urls = ['http://python123.io/ws/demo.html']

            def parse(self, response):
                fname =response.url.split('/')[-1]
                with open(fname,'wb')as f:
                    f.write(response.body)
                self.log('Saved file %s.' % name)#将网页内容爬取下来并保存为HTML文件

        ```

    4. 运行爬虫，获取网页

        - 打开命令行执行命令：
            >scrapy crawl demo
