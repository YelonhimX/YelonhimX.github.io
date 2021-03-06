---
layout:     post
title:      "Python数据分析与展示学习笔记(一):NumPy入门"
subtitle:   " \"收集、分析、表达\""
date:       2019-11-05 17:22:52
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

## 1. NumPy入门单元

### 1.0. 数据的维度

1. 从一个数据到一组数据
   1. 一个数据：表达一个含义
   2. 一组数据：表达一个或多个含义
2. **维度**：一组数据的组织形式
   - 一组数据可以在不同的维度上展开表达不同的含义
   1. 一维数据：由对等关系的有序或无序数据构成，采用线性方式组织
      1. 对应*列表*、*数组*和*集合*等概念
    - *列表*和*数组*
      - 一组数据的有序结构
      - 区别：
        - 列表：数据类型可以不同
        - 数组：数据类型相同
   2. 二维数据：由多个一维数据构成，是一维数据的组合形势
        - 表格是典型的二维数据
        - 其中，表头是二维数据的一部分
   3. 多维数据：多维数据有一维或二维数据在**新维度**上扩展而成
      
        - 表格(二维数据)在时间维度的积累
   4. 高维数据：仅利用最基本的**二元关系**展示数据间的复杂结构
    1. 例子：

        ```python
        {
            "firstName":"Edward",
            "lastName" :"Wang",
            "address" :{
                "streetAddr":"中关村南大街5号"，
                "city"
                :"北京市"，
                "zipcode" :"10081"
            },
            "prof" :["Computer System","Security"]
        }
        ```

   - 键值对方式保存
   - 数据维度的Python表示
       1. 一维数据：*列表*和*集合*类型
       2. 二维数据：*列表*类型
       3. 多维数据：*列表*类型
       4. 高维数据：*字典*类型或数据表示格式
          1. 数据表示格式：
             1. Json
             2. Xml
             3. Yaml

### 1.1 NumPy的数组对象

1. NumPy
   1. NumPy是一个开源的Python科学计算基础库
      - 一个强大的N为数组对象`ndarry`
      - 广播功能函数
      - 整合C/C++/Fortran代码的工具
      - 线性代数、傅里叶变换、随机数生成功能
      - NumPy是SciPy、Pandas等数据处理或科学计算库的基础
   2. NumPy的引用

    ```python
    import NumPy as np
    #as np表示将引入模块改为别名np，建议使用上述约定的别名
    ```

2. N维数组对象：ndarry
   1. 为什么需要一个数组？
      - 举个例子：计算
        $$
			A^2+B^3
        $$
        - 其中，A和B是一维数组
        引用ndarry数组之前：

        ```python
        def pySum():
            a = [0,1,2,3,4]
            b = [9,8,7,6,5]
            c =[]   
            for i in range(len(a)):
                c.append(a[i]**2 + b[i]**3)
            return c

        print(pySum())
        ```

        引用ndarray数组后：

       ```python
       import NumPy as np
       def npSum():
          a = np.array([0,1,2,3,4])
          b = np.array([9,8,7,6,5])

          c = a**2 + b**3
          #将数组a，b当成两个数据，在维度相同时可以直接进行运算

          return c

       print(npSum())

       ```

        - 数组对象可以去掉元素间运算所需的循环，使一维向量更像单个数据。
        - 设置专门的数组对象，经过优化，可以提升这类应用的运算速度。

    - **观察**：在科学计算中，一个维度所有数据的类型往往相同。
      - 数组对象采用相同的数据类型，有助于节省运算和存储空间
      
   2. ndarray
       1. ndarray是一个多维数组对象，由两部分构成：
          - 实际的数据
          - 描述这些数据的元数据(数据维度、数据类型等)
       2. ndarray数组一般要求所有元素类型相同(同质)，数组下标从0开始。
       3. ndarray实例：
          - `np.array()`生成一个ndarray数组
          - `np.array()`输出成[]形势，元素由空格分割
          - 两个基本概念：
               - 轴(axis)：保存数据的维度
               - 秩(rank)： 轴的数量
       4. ndarray对象的属性
       
           |     属性      |                     说明                     |
           | :-----------: | :------------------------------------------: |
           |   **.ndim**   |          秩，即轴的数量或维度的数量          |
           |  **.shape**   |     ndarray对象的尺度，对于矩阵，n行m列      |
           |   **.size**   | ndarray对象元素的个数，相当于.shape中n*m的值 |
           |  **.dtype**   |            ndarray对象的元素类型             |
           | **.itemsize** |  ndarray对象中每个元素的大小，以字节为单位   |

        5. ndarray的元素类型
           - 对比：Python语法仅支持整数、浮点数和复数3种类型
             - 科学计算设计数据较多，对存储和性能都有较高要求
             - 对元素类型精细定义，有助于NumPy合理使用存储空间并优化性能
             - 对元素类型精细定义，有助于程序员对程序规模有合理评估
        6. ndarray数组可以由非同质对象构成。
           1. 非同质ndarray元素为对象类型
           2. 非同质ndarray对象无法有效发挥NumPy优势，尽量避免使用

### 1.2. ndarray数组的创建和变换

1. 创建方法
   - 从Python中的列表、元组等类型创建

        ```python
        import NumPy as np
        x = np.array(list/tuple)
        x = np.array(list/tuple,dtype = float32)
        #当np.array()不指定dtype是，NumPy将根据数据情况关联一个dtype类型。
        ```

   - 使用NumPy中函数创建，如：arange，ones，zeros等
   
        |         函数         |                        说明                         |
        | :------------------: | :-------------------------------------------------: |
        |    `np.arange(n)`    |  类似`range()`函数，返回ndarray类型，元素从0到n-1   |
        |   `np.ones(shape)`   | 根据shape生成一个全1数组，shape是元祖类型(先横后纵) |
        |  `np.zeros(shape)`   |                同上，生成一个全0数组                |
        | `np.full(shape,val)` |       同上，生成一个数组，每个元素之都是`val`       |
        |     `np.eye(n)`      |    创建一个正方的n*n单位矩阵，对角线为1，其余为0    |

        - 此外还有`ap.ones_like(a)`即依照数组`a`的格式生成一个新数组，内中元素为1；仿照表上的函数，还有两种生成方法。
        - `np.linspace(,endpoint)`：根据起止数据**等间距地**填充数据，形成数组(默认为浮点数)。endpoint为布尔值表示最后数字是否包含在最终生成的数组里

            ```python
            a = np.linspace(1,10,4)
            print(a)
            ```

            输出：
            >array([1.,4.,7.,10.])

        -  `np.concatenate()`：将两个或多个数组合并成一个新的数组
   - 从字节流(raw bytes)中创建
   - 从文件中读取特定格式创建
   
2. 数组的变换

   1. 维度变换

        ```python
        a = np.ones((2,3,4),dtype = np.int32)
        ```

      - 常用方法

      |         方法         |                          说明                           |
      | :------------------: | :-----------------------------------------------------: |
      |  `.reshape(shape)`   | 不改变数组元素，返回一个shape形状的数组，**原数组不变** |
      |   `.resize(shape)`   |           与.reshape()功能一致，但修改原数组            |
      | `.swapaxes(ax1,ax2)` |            将数组n个维度中的两个维度进行调换            |
      |     `.flatten()`     |  对数组进行降维，返回折叠后的一位数组，**原数组不变**   |

    2. 类型变换

       ```python
        new_a = a.astype(new_type) 
       ``` 

       - astype()方法一定会创建新的数组(原始数据的一个拷贝)，即使两个类型一致。
       - ndarray数组向列表的转换：

       ```python
       ls = a.tolist()
       ```

### 1.3. 数组的操作————索引和切片

- 索引：获取数组中特定位置元素的过程
- 切片：获取数组元素子集的过程

1. 一维数组：
    - 一维数组的索引和切片同列表类似
      - 索引：形如`a[2]`的取元素方法。
      - 切片：

       ```python
       a[起始编号:终止编号(不含):步长]
       a[1:6:2]#example
       ```

2. 多维数组：
   - 索引：

     ```python
     a[1,2,3]#按编号索引元素
     a[-1,-2,-3]#倒数检索
     ```

    - 切片：

    ```python
    a = np.arange(24).reshape((2,3,4))#生成一个元素取值从0~24的三维数组
    a[:,1
    #`:`指选取这一维度的所有元素，`1`表示第2个维度的2号(起始位置是0号)元素，
    #`-3`表示第3个维度的倒数第3号元素。
    a[:,1:3,:]
    #第二个维度的从1号到3号(左闭右开，不含3号)元素。
    a[:,:,::2]
    #`::2`表示步长为二的幅度选取元素。
    ```

### 1.4. ndarray数组的运算

1. 数组与标量之间的运算
   - 数组与标量之间的运算作用于数组的每一个元素

   ```python
   #创建数组：
   a_234 = np.arange(24).reshape((2,3,4))
   a_234
   >>array([[[ 0,  1,  2,  3],
             [ 4,  5,  6,  7],
             [ 8,  9, 10, 11]],

           [[12, 13, 14, 15],
            [16, 17, 18, 19],
            [20, 21, 22, 23]]])
   #与标量进行乘除运算
    a_234/a.mean()#a.mean取元素平均值
    >>array([[[0.        , 0.28571429, 0.57142857, 0.85714286],
        [1.14285714, 1.42857143, 1.71428571, 2.        ],
        [2.28571429, 2.57142857, 2.85714286, 3.14285714]],

       [[3.42857143, 3.71428571, 4.        , 4.28571429],
        [4.57142857, 4.85714286, 5.14285714, 5.42857143],
        [5.71428571, 6.        , 6.28571429, 6.57142857]]])

    #与标量进行加减运算
    a_234+10
    >>array([[[10, 11, 12, 13],
        [14, 15, 16, 17],
        [18, 19, 20, 21]],

       [[22, 23, 24, 25],
        [26, 27, 28, 29],
        [30, 31, 32, 33]]])
    ```

2. numpy中自带的对数据操作的一元函数

- 这些函数会对数组中的每一个元素进行相同的操作，a表示数组，可以是一维也可以是多维。
- 以下表格供查阅

|                                            函数                                             |                         功能                         |
| :-----------------------------------------------------------------------------------------: | :--------------------------------------------------: |
|                               **np.abs(a)** 或 **np.fabs(a)**                               |                 计算各个元素的绝对值                 |
|                                       **np.sqrt(a)**                                        |                计算数组各元素的平方根                |
|                                      **np.square(a)**                                       |                计算数组各元素的平方根                |
|                       **np.log(a)**、**np.log10(a)**、**np.log2(a)**                        |     计算数组各元素的自然对数、10底对数、2底对数      |
|                               **np.ceil(a)**、**np.floor(a)**                               |          计算数组各元素的ceiling值或floor值          |
|                           **np.around(a, decimals=0, out=None)**                            |            按指定的小数点位数返回新的数组            |
|                                       **np.rint(a)**                                        |              计算数组各元素的四舍五入值              |
|                                       **np.modf(a)**                                        | 将数组各元素的小数和整数部分以两个独立的数组形式返回 |
| **np.cos(a)**、**np.sin(a)**、**np.tan(a)**、**np.cosh(a)**、**np.sinh(a)**、**np.tanh(a)** |         数组各元素进行平通型和双曲型三角函数         |
|                                        **np.exp(a)**                                        |                       指数运算                       |
|                                       **np.sign(a)**                                        |           计算各元素的符号值，1(+),0,-1(-)           |
|                                         **a\*\*2**                                          |               对数组各元素进行指数运算               |

- 函数并不会改变原来的数组，而是返回一个新的数组。

3. numpy中自带的对数据操作的二元函数

- 主要涉及到两个数组各元素之间的运算，x/y都是数组，数组的类型必须一致。

|              函数               |                     功能                     |
| :-----------------------------: | :------------------------------------------: |
|       `+` `-` `*``/``**`        |        两个数组中的元素进行对应的运算        |
| np.minimum(x.y),np.maximun(x,y) |         各对应元素之间的最小/最大的          |
|           np.mod(x,y)           |                元素级的模运算                |
|        np.copysign(x,y)         | 将数组y中的元素值的符号赋给数组x中的对应元素 |
|         > < >= <= == !=         |           算术比较，产生布尔型数组           |

 

