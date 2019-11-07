---
layout:     post
title:      "Python数据分析与展示学习笔记(二):NumPy进阶使用"
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

## 2. NumPy进阶使用单元

### 2.1.数据的csv格式文件存取

- csv文件
   - csv (Comma-Separater Value，逗号分隔值)
   - csv是一种常见的文件格式，用来存储批量数据
   - NumPy读写csv文件的方法：

     ```python
     np.savetext(fname,array,fmt = '%.18e',delimiter = None)
     ```

     - `fname`：文件、字符串或者产生器，也可以是.gz或.bz2.的压缩文件
     - `array`：存入文件的数组
     - `fmt`  ：写入文案激动呢格式，例如：`%d`、`%.2f`、`%.18e`
     - `delimiter`：分割字符串，默认是任何空格
     
     ```python
     np.loadtxt(fname,dtype = np.float,delimiter = None,unpack = False)
     ```

     - `fname`：文件、字符串或者产生器，也可以是.gz或.bz2.的压缩文件
     - `dtype`：数据类型，可选
     - `delimiter`：分割字符串，默认是任何空格
     - `unpack`：如果True，读入属性将分别写入不同变量
   - csv文件的局限性：
     - csv只能有效存储一维和二维数组

### 2.2.多维数据的存取

- `tofile()`和`fromfile()`存取方法：
  - `tofile()`写入方法：
    
    ```python
    a.tofile(fname,sep = '',format = '%s')
    ```

    - `fname`：文件、字符串
    - `sep`：数据分割字符串，如果是空串，写入文件为二进制
    - `format`：写入文件的格式
  - `fromfile()`读取方法：
    
    ```python
    np.fromfile(fname,dtype = float,count = -1,sep = '')
    ```

    - `fname`：文件、字符串
    - `dtype`：数据类型
    - `count`：读入元素个数，-1表示读入整个文件
    - `sep`：数据分割字符串，如果是空串，读入文件为二进制
    - 注意事项：
      - 该方法需要读取时知道存入文件时数组的维度和元素类型
      - `tofile()`和`fromfile()`需要配合使用
      - 可以通过元数据文件存储文件的元信息
- NumPy的便捷文件存取：
  - `np.save`或`np.savez`
  
    ```python
    np.save(fname,array)
    np.savez(fname,array)
    ```

    - `fname`：文件名，以.npy为扩展名，压缩扩展名为.npz
    - `array`：数组变量
  - `npload`
  
    ```python
    np.load(fname)
    ```

  - npy文件将文件以二进制方式保存，将文件元信息写入文件第一行，从而保存了源文件维度和元素类型

### 2.3.NumPy库的随机数函数

- NumPy的random子库

  - 一般随机数函数

  |            函数             |                             说明                              |
  | :-------------------------: | :-----------------------------------------------------------: |
  |    `rand(d0,d1,...,dn)`     | 根据$d_0\text{~}d_n$创建随机数数组，浮点数，$[0,1)$，均匀分布 |
  |    `randn(d0,d1,...,dn)`    |        根据$d_0\text{~}d_n$创建随机数数组,标准正态分布        |
  | `randint(low[,high,shape])` |     根据shape创建随机数数组或整数数组，范围是$[low,high)$     |
  |          `seed(s)`          |                  随机数种子，s是给定的种子值                  |

  - 高级随机数函数

  |             函数             |                                              说明                                              |
  | :--------------------------: | :--------------------------------------------------------------------------------------------: |
  |         `shuffle(a)`         |                            根据数组啊、的第1轴进行随排列，改变数组a                            |
  |       `permutation(a)`       |                       根据数组a的第1轴产生一个新的乱序数组，不改变数组a                        |
  | `choice(a[,size,replace,p])` | 从一位数组a中以概率`p`抽取元素，形成`size`形状新数组`replace`表示是否可以重用元素，默认为False |

  - 生成有特定分布数组的函数
  
  |           函数           |                                                                       说明                                                                       |
  | :----------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------: |
  | `uniform(low,high,size)` | 产生具有[均匀分布](https://baike.baidu.com/item/%E5%9D%87%E5%8C%80%E5%88%86%E5%B8%83/954451?fr=aladdin)的数组，low为起始值，high结束值，size形状 |
  | `normal(loc,scale,size)` |             产生[正态分布](https://baike.baidu.com/item/%E6%AD%A3%E6%80%81%E5%88%86%E5%B8%83)的数组，loc均值，scale标准差，size形状              |
  |   `poisson(lam,size)`    |               产生[泊松分布](https://baike.baidu.com/item/%E6%B3%8A%E6%9D%BE%E5%88%86%E5%B8%83)的数组，lam随机事件发生率，size形状               |

### 2.4. 统计函数

- NumPy库直接提供统计类函数

|                  函数                  |                         说明                          |
| :------------------------------------: | :---------------------------------------------------: |
|          `sum(a,axis = None)`          |  根据给定轴axis计算数组a相关元素之和，axis整数或元组  |
|         `mean(a,axis = None)`          | 根据给定轴axis计算数组a相关元素的期望，axis整数或元组 |
| `average(a,axis = None,wights = None)` |      根据给定轴axis计算数组a相关元素的加权平均值      |
|          `std(a,axis = None)`          |        根据给定轴axis计算数组a相关元素的标准差        |
|          `var(a,axis = None)`          |         根据给定轴axis计算数组a相关元素的方差         |

```python
In [129]: a=np.arange(15).reshape(3,5)

In [130]: a
Out[130]: 
array([[ 0,  1,  2,  3,  4],
       [ 5,  6,  7,  8,  9],
       [10, 11, 12, 13, 14]])

In [131]: np.sum(a)
Out[131]: 105

In [132]: np.mean(a,axis=1)
Out[132]: array([  2.,   7.,  12.])

In [133]: np.mean(a,axis=0)
Out[133]: array([ 5.,  6.,  7.,  8.,  9.])

In [134]: np.average(a,axis=0,weights=[10,5,1])
Out[134]: array([ 2.1875,  3.1875,  4.1875,  5.1875,  6.1875]) #第三个轴4.185=2*10+7*5+12*1/(10+5+1)

In [135]: np.std(a)
Out[135]: 4.3204937989385739

In [136]: np.var(a)
Out[136]: 18.666666666666668
```

|             函数              |                    说明                     |
| :---------------------------: | :-----------------------------------------: |
|      `min(a)` ,`max(a)`       |       计算数组a中元素的最小值、最大值       |
|   `argmin(a)` ,`argmax(a)`    | 计算数组a中元素最小值、最大值的降一维后下标 |
| `unravel_index(index, shape)` |   根据shape将一维下标index转换成多维下标    |
|           `ptp(a)`            |      计算数组a中元素最大值与最小值的差      |
|          `median(a)`          |       计算数组a中元素的中位数（中值）       |

```python
In [137]: b=np.arange(15,0,-1).reshape(3,5)

In [138]: b
Out[138]: 
array([[15, 14, 13, 12, 11],
       [10,  9,  8,  7,  6],
       [ 5,  4,  3,  2,  1]])

In [139]: np.max(b)
Out[139]: 15

In [140]: np.argmax(b)
Out[140]: 0

In [141]: np.unravel_index(np.argmax(b),b.shape)
Out[141]: (0, 0)

In [142]: np.ptp(b)
Out[142]: 14

In [143]: np.median(b)
Out[143]: 8.0#通过公式求得，结果为浮点数
```

### 2.5. NumPy的梯度函数

|       函数       |                         说明                         |
| :--------------: | :--------------------------------------------------: |
| `np.gradient(f)` | 计算数组f中元素的梯度，当f为多维是，返回每个维度梯度 |

- 梯度：连续值之间的变化率，即斜率
  XY坐标轴连续是三个X坐标对应的Y轴值：a，b，c，其中，b的梯度是：$\frac{c-a}{2}$