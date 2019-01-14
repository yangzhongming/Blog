---
title: Jupyter NoteBook使用介绍
tags: [日常笔记]
categories: 工具介绍
images: 
---
### 设置工作目录
 * Anaconda安装完成后，自带了Jupyter NoteBook，安装成功后默认的Jupyter NoteBook设置查看如下，点击Jupyter NoteBook右键属性：
	 * 【目标T】：<br/>
	 C:\Anaconda3\python.exe C:\Anaconda3\cwp.py C:\Anaconda3 C:\Anaconda3\python.exe C:\Anaconda3\Scripts\jupyter-notebook-script.py %USERPROFILE%	
	 * 【起始位置】：<br/>
	C:\Users\Administrator

* 默认设置的工作目录是C:\Users\Administrator下，参考了网上说的  修改默认工作目录的方法，最简单的是按以下实现：
	* 【目标T】：<br/>
	C:\Anaconda3\Scripts\jupyter-notebook.exe
    * 【起始位置】：<br/>
    E:\Jupyter  （该目录需要提前创建）

    按以上设置完后启动后，工作目录就设置为E盘下。


## 主题的安装

  * [jupyterthemes](https://pypi.org/project/   jupyterthemes/0.13.6/)的官方下载地址可通过如下命令安装：
	`pip install jupyterthemes==0.13.6`

    我想安装的主题是monokai，通过执行以上命令后，发现没有monokai主题模板。通过查看网上其他安装方法，最终按以下方式执行成功：

	      cd /d C:\Anaconda3\Scripts
	      pip install jupyter-themer

    安装成功后，查看目前的主题模板，并执行monokai的设置：
	
		jt -l
	    //可查看如下模板信息：
	    chesterish
	    grade3
	    gruvboxd
	    gruvboxl
	    monokai
	    oceans16
	    onedork
	    solarizedd
	    solarizedl
	    //设置monokai模板主题
	    jt -t monokai -f dejavu -fs 12 -T
	
*	参考链接：[Jupyter Notebook介绍、安装及使用教程](https://www.jianshu.com/p/91365f343585)
*	在安装过程中会出现pip版本过低和jt -l命令无效。需要执行以下命令：

		
	    python -m pip install --upgrade pip
		pip install --upgrade jupyterthemes
		