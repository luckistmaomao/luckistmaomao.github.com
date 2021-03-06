---
layout: post
title: SSD知识入门 
summary:  作个儿入了一块840 evo 250g，做了点功课
categories: [SSD]
tags: [SSD]
published: true
---

SSD知识入门
===

##一、why ssd?
传统的机械硬盘至少有95%的时间耗在机械部件的运作上，而SSD则无需这些操作，所以性能有了极大的提升

##二、主控
Intel、SandForce、Marvell等

##三、颗粒
- ###分类   
有SLC、MLC、TLC这三种   
SLC是最好的闪存颗粒，有着最好的性能，有着最久的寿命，当然也有最贵的价格。这几种闪存的物理结构是相同的，SLC是最简单的一种，加电就是1，断电就是0，而MLC储存电压信号组合有11，01，00，10四种，TLC就更复杂了，有000，001，010，011，111，110，100，101这8种。
所以MLC比SLC需要更精确的电压控制，编排数据过程所需时间更多，因此写入性能也会大幅下降，理论上只有SLC的1/4；读取，特别是**随机读取性能**也会受影响，因为需要花更多的时间从四种电信号状态中区分所需数据，读取性能只有SLC的1/3。TLC亦是同理。
- ###寿命
一次P/E循环的意思：写入擦除1次等于该固态硬盘全部容量的数据，所以固态硬盘容量越大，寿命越长就是这个道理。
SLC闪存一次P/E循环只需要击穿一次氧化层，而MLC需要不同的电压多次击穿氧化层，物理损害比SLC要严重得多，MLC的写入次数指数级下降，比如SLC的理论寿命是1万-10万次，而MLC的写入寿命上限就只有1万次，而且随着工艺的进步，这个数值还在下降，25nm MLC普遍只有3000-5000次，至于TLC那就呵呵了。
当然，个人使用的话，其实寿命都可以不用看的，哪怕你天天24小时不间断下载，MLC的寿命也能妥妥保证你使用三五年以上。


##四、工作原理
- ###TRIM
    首先要明白一点，当你删除一个文件时，操作系统并不会去真正的去删除它，只是把这个文件的地址标记为空就好了。  
    对于机械硬盘来说这不是什么问题，需要这段空间的时间直接写覆盖就可以了。而对于SSD来说需要先擦除才能写入。 
    Trim就是这样一条指令，用来标记一个页是否有效。
- ###GC
    分两种情况  
    1. trim后立即GC
    2. 等待闲时GC
- ###写入放大
    由于写入是对page，而擦出是对block  
    如page 4kB,block 4k*256=1024kB  
    在极端情况下，你要写入4kB数据，而那个要被写入的块里已经没有干净的空间了，这时就需要队整个块进行擦除，实际写4KB数据，造成了整个块1024KB的写入操作，那就是256倍的放大。当然实际使用不会这么夸张，一般的话应该会在1～20倍之间。
- ###预留空间
    预留空间越大
    1. 性能越好
    2. 写入放大比越小
    3. 使用寿命越长
- ###掉速
这里可以很肯定地说，市场上九成以上的固态硬盘使用久了，都会掉速，因为这是由SSD的写入方式决定了它越用越慢的特性，数据写入的越多性能就会越差，后写入的数据不能直接覆盖原来的数据，而是要放到一边，等到主控将原来数据擦除掉，才能将后写入的数据放到原来数据的位置。当然如果你是实时GC就可以做到不掉速了


###五、性能评估
- ###对于消费级用户
    其实看看4k随机读写性能就好了，也别有事没事就去跑个分，一次大概要写入5GB不可压缩的数据，再加上写入放大，你算算要多少。
- ###对于企业级用户
    测试方法就不同了，需要看4k随机写连续两小时测试后的性能，这样的数据才有价值  
![Alt text](/images/ssd_data.png)




###参考资料：  
[SSD知识入门与提高](http://www.valleytalk.org/wp-content/uploads/2013/03/ssd%E7%9F%A5%E8%AF%86%E5%88%86%E4%BA%AB-%E6%96%B0%E6%B5%AA%E5%86%85%E9%83%A8-2%E5%B0%8F%E6%97%B6%E7%89%88%E6%9C%AC-%E6%9C%80%E7%BB%88%E7%B2%BE%E7%AE%80%E7%89%88-pub.pdf)  
[关于固态硬盘相关常识问题的解答！](http://tieba.baidu.com/p/2816286572)
