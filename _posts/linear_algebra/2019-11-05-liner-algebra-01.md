---
layout:     post
title:      "线性代数学习笔记(一)"
subtitle:   "\"数学是打开科学大门的钥匙。——培根\""
date:       2019-11-06 16:58:46
author:     "YelonhimX"
header-img: "img/in-post/Beautyofmath1.jpg"
catalog: true
tags:
    - 生活
    - 精神折磨
    - 数学
    - 线性代数
    - 计算机
    - Python
    - 人工智能
    - 机器学习
---
# 线性代数笔记(一)

## 1. 向量

### 1.1. 什么是向量

- 为什么线性代数如此重要？
  - 线性代数是从研究一个数拓展到一组数
- 一组数的表示方法————**向量**(Vector)
- **向量**(Vector)是线性代数研究的基本元素
  - 一组数有什么用？
    - 最基本的出发点：表示方向
    ![向量](https://raw.githubusercontent.com/YelonhimX/Code/master/Python/build/drawio_assets/math-vector.svg?sanitize=true)
    - 起始点不重要？
      - 从(-1,-1)到(3,2)和从(0，0)到(4,3)是一样的，只是坐标系不同。
      - 为了研究方便，我们定义向量都从原点开始。
      - 但是顺序是重要的！**即向量是一组有序的数。**
  - 如果只是表示方向，最多三个维度就够了
    - 抽象化：n维向量
      - 刻画事物的不同角度就可以理解为不同维度。比如刻画一个房子的信息：
       
      | 面积  | 卧室  | 卫生间 | 最近地铁站(km) | 价格(万) |
      | :---: | :---: | :----: | :------------: | :------: |
      |  120  |   3   |   2    |       2        |   666    |

      就可以写为5维向量：(120,3,2,2,666)
        - 此时，向量就是一组数，这组数的含义由使用者定义。
  - 两个视角看似不同，但可以互相转换
    - 一个方向，就是一个点；
    - 空间中的一个点，可以看做从原点指向这个点的一个方向
    - 在学习初始，使用方向的视角，更直观，更形象
    - 更关键的是：这两个视角，都不是简单的“一组数”
    - 一个是一个有向线段，另一个是空间中的点

### 1.2. 向量的更多术语和表示法

- 更严格的一些定义：
  - 和向量相对应，一个数字，称为**标量**
  - 代数，用符号代表数。和标量相区别，向量的符号画箭头：
  
    $$
    \vec{v}
    $$

  - 个别情况下，尤其是几何学中，我们会考虑向量的起始点：
  
    $$
    \overrightarrow{OA}
    $$
  
  - 行向量和列向量
  
    $$
    (1,2)\qquad{行向量}\\[7pt]\\
    \begin{pmatrix}0\\1\end{pmatrix}\qquad{列向量}
    $$

  - 通常教材，论文，提到向量，都指向列向量
  - 由于横版印刷原因，列向量有时使用符号：
  
    $$
    (3,4)^{T}
    $$

### 1.3. Python代码实现向量类

```python
class vector:
    def __init__(self,lst):
        self._values = lst
        #初始化类，将数组传入
    def __len__(self):
        #返回向量长度(youduoshaoyuansu )
        return len(self._values)
    def __getitem__(self,index):
        #取向量的第index个元素
        return self._values[index]
    def __repr__(self):
        return "Vector({})".format(self._values)
        #使用__repr__魔法方法规定系统内调用vector类的格式
    def __str__(self):
        return "({})".format(",".join(str(e) for e in self._values))
```

- `__repr__`和`__str__`方法的异同
  - `__str__`是用户使用`print`函数调用的。

### 1.4. 向量的基本运算

- 向量加法
  $$
  (5,2)^{T}+(2,5)^{T} = (7,7)^{T}
  $$
  - [平行四边形法则](https://baike.baidu.com/item/%E5%B9%B3%E8%A1%8C%E5%9B%9B%E8%BE%B9%E5%BD%A2%E5%AE%9A%E5%88%99/7534360?fr=aladdin)
  - 两个向量相加，相当于他们在x轴和y轴位移增量的总加和，即：
  
  $$
  (a,b)^{T}+(c,d)^{T} = (a+c,b+d)^{T}
  $$

  多维空间中：

  $$
  \begin{pmatrix}
  v_1\\\dots\\v_n
  \end{pmatrix}+\begin{pmatrix}
   u_1\\\dots\\u_n   
  \end{pmatrix} = \begin{pmatrix}
   v_1+u_1\\\dots\\v_n+u_n   
  \end{pmatrix}
  $$

- 数量乘法
  同理，向量与标量的乘法即多次向量的加和：
  
  $$
  k\times(a,b)^{T} = (ka,kb)^{T} 
  $$
  
  多维向量中同理。

### 1.5. 实现向量的基本运算

```python
class vector:

    def __init__(self,lst):
        self._values = list(lst)
        #构造函数，初始化类，将数组传入,用list方法复制lst变量，确保vector不可更改性
    def __len__(self):
        #返回向量长度(youduoshaoyuansu )
        return len(self._values)
    def __getitem__(self,index):
        #取向量的第index个元素
        return self._values[index]
    def __repr__(self):
        return "Vector({})".format(self._values)
        #使用__repr__魔法方法规定系统内调用vector类的格式
    def __str__(self):
        return "({})".format(",".join(str(e) for e in self._values)
    def __add__(self,another)
        #向量加法，返回一个新的向量
        assert len(self) == len(another),"Error"
        return Vector([a+b for a,b in zip(self,another.)])
    def __sub__(self,another):
        #向量减法
        assert len(self) == len(another),"Error"
        return vector([a - b for a,b in zip(self,another)])
    def __mul__(self,k):
        #返回数量乘法的结果向量：self*k
        return vector([a*k for a in self])
    def __rmul__(self,k):
        #返回数乘：k*self
        return vector([a*k for a in self])#可以写为self*k
    def __pos__(self):
        #对结果取正
        return 1 * self
    def __neg__(self):
        #对结果取负
        return -1 * self
    def __iter__(self)
        #通过添加迭代器保证_values的私有性
        return self._values.__iter__()
```

### 1.6. 向量运算的基本性质

- 类比代数运算：
  - 交换律、结合律：
  
  $$
  \vec{u} + \vec{v} = \vec{v} + \vec{u}\\[7pt]
  (\vec{u}+\vec{v}) + \vec{w} = \vec{u} + (\vec{v}+\vec{w})
  $$

  - 分配率：
  
  $$
  k(\vec{u}+\vec{v}) = k\vec{u}+k\vec{v}\\[7pt]
  $$

### 1.7. 零向量

- 零向量不是直接定义的，而是从推导出一个性质出发
  
  $$
  {对于任意一个向量}\vec{u}{，}{都存在一个向量}O{,}{满足：}\vec{u}+O = \vec{u}
  $$

- 证明：
  
  $$
  \vec{u} = \begin{pmatrix}u_1\\u_2\\\dots\\u_n\end{pmatrix},O = \begin{pmatrix}o_1\\o_2\\\dots\\o_n\end{pmatrix}\qquad\vec{u}+O = \begin{pmatrix}u_1\\u_2\\\dots\\u_n\end{pmatrix}
  +
  \begin{pmatrix}
    o_1\\o_2\\\dots\\o_n
  \end{pmatrix} 
  = \begin{pmatrix}
    u_1+ o_1\\u_2+o_2\\\dots\\u_n+o_n
  \end{pmatrix} 
  =\begin{pmatrix}
    u_1\\u_2\\\dots\\u_n
   \end{pmatrix}
  $$
  
  即：
  
  $$
  \left\{
      \begin{aligned}
        u_1 + o_1 &= u_1\\
        u_2 + o_2 &= u_2\\
        \dots\\
        u_n + o_n &= u_n
      \end{aligned}
      \right.
  $$
  
  解方程得：
  
  $$
   \left\{
      \begin{aligned}
        o_1 &= 0\\
        o_2 &= 0\\
        \dots\\
        o_n &= 0
      \end{aligned}
      \right.
  $$
  
  故而有向量$O$：
  
  $$
   O = \begin{pmatrix}0\\0\\\dots\\0\end{pmatrix}
  $$
  
  我们称这个向量，为**零向量**
  - 注意：这个**零向量**$O$没有箭头
- 同样地：

$$
对于任意一个向量\vec{u}，都存在一个向量\overrightarrow{-u}，满足：\\[7pt]
\vec{u}+\overrightarrow{-u} = 0
$$

上述$\overrightarrow{-u}$唯一(反证法证明)，同时注意到：

$$
\overrightarrow{-u} = -1 · \vec{u}
$$

### 1.8. 零向量的实现

- 注意到创建零向量的方法不是基于类中的子方法，而是要基于类的基本方法即类方法：

```python
class vector:

    def __init__(self,lst):
        self._values = list(lst)
        #构造函数，初始化类，将数组传入,用list方法复制lst变量，确保vector不可更改性

    @classmethod
    def zero(cls,dim):
        #返回一个dim维的零向量
        return cls([0]*dim)
```