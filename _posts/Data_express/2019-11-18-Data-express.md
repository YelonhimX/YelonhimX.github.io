---
layout:     post
title:      "Python数据分析与展示学习笔记(三):图像的处理"
subtitle:   " \"收集、分析、表达\""
date:       2019-11-18 11:51:00
author:     "子川"
header-img: "img/data_analyse.jpg"
catalog: true
tags:
    - 爬虫
    - Python
    - 计算机
    - 数据处理
    - 编程
    - 学习(笔记)
---

# Python数据分析与展示

## 3.图像的处理单元

### 3.1 图像的数组表示

#### 1. 图像的RGB色彩模式

图像一般使用RGB色彩模式，即每个像素点的颜色由*红(R)*、*绿(G)*、*蓝(B)*组成。

RGB三个颜色通道的变化和叠加得到各种颜色，其中：

R、G、B，取值范围为[0,255]。

RGB形成的颜色包括了人类视力所能感知的所有颜色。

#### 2. PIL库

**PIL**,*Python Image Library*

PIL库是具有图像处理功能的强大第三方库

##### 2.1. 安装：

```cmd
pip install pillow
```

##### 2.2. Image类

*Image*是**PIL**库中代表一个图像的类(对象)

```python
from PIL import Image
```

#### 3. 图像的数组表示

图像是一个有像素组成的二维矩阵，每个元素是一个RGB值。

```python
from PIL import Image
import pynum as np
#直接将图片打开，保存为数组形式

im = np.array(Image.open("D:/pycodes/beijing.jpg"))

print(im.shape,im.dtype)
#图像是一个三维数组，维度分别是高度、宽度和像素的RGB值。
>>>(669,1012,3)uint8
```

### 3.2 图像的变换

图像表示为数组，而数组可以进行运算，可以由此进行变换。

#### 1. 步骤

读入图像后，获得像素RGB值，修改后保存为新的文件。

#### 2. 实现

##### 2.1 反色模式：

```python 
rom PIL import Image
import pynum as np
#直接将图片打开，保存为数组形式

a = np.array(Image.open("D:/pycodes/beijing.jpg"))

print(a.shape,a.dtype)
#图像是一个三维数组，维度分别是高度、宽度和像素的RGB值。
>>>(669,1012,3)uint8
#计算每个像素的补植（与255的差值）即反色
b = [255,255,255] - a

im = Image.formarray(b.astype('uint8'))

im.save("D:/pycondes/fcity2.jpg")
```

##### 2.2 底片模式：

```python
#使用convert('l')方法，以灰度模式打开图片，这样图片是二维数组。

#底片模式
b = 255 - a

im = Image.fromarray(b.astype('uint8'))
im = save('newpath')
```

##### 2.3 区间变换：

```python
a = nparray(Image.open("path").convert('L'))
c = (100/255)*a + 150#区间变换
im = Image.formarry(c.astype('uint8'))
im.save('newpath')
```
