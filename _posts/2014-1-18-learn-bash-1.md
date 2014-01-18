---
layout: post
title: shell学习笔记（一）
summary: 开始学习shell
categories: [shell]
tags: [shell]
published: true
---

#{{page.title}}#

##一、简介

1、 shell 是**解释型**而不是**编译型**的  
2、 shell 具有不同的类型，可用下面的命令查看  
{%highlight bash%}
yu@yu:~$ cat /etc/shells 
/etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
{%endhighlight%}

##二、编写和调试脚本
1、 通过任何一个文本编辑器，如**vim**、emacs建立脚本  
2、 一个例子  

{%highlight bash%}
#!/bin/bash

clear

echo "The script starts now"

echo "Hi,$USER!"
echo

echo "I will now fetch you a lsit of connected users:"
echo
w
echo

echo "I'm sitting two variables now."
COLOUR="black"
VALUE="9"
echo "This is a string: $COLOUR"
echo "And this is a number: $VALUE"
echo 

echo "I'm giving you back your prompt now."
echo
{%endhighlight%}
可以建立一个目录**~/scripts** 来存放shell脚本  
同时将此目录添加到**PATH**变量中
`export PATH="$PATH:~/scripts"`  

3、 执行脚本   
	chmod +x scriptname.sh
	./scriptname.sh
或者
	bash/sh/source scriptname.sh  

4、 调试脚本

调试整个脚本
	bash -x scriptname.sh  
又可以在需要调试的代码段前后分别加上`set -x`，`set +x`
	...
	set -x
	...
	一段代码
	...
	set +x  

