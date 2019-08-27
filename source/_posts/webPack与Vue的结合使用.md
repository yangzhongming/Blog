---
title: webpack与Vue整合
tags: [前端]
categories: 前端
images: 
date: 2019-02-28 21:00:00
---
## 网页中的静态资源
网页引用了过多的script,当页面加载过程中会发起多次二次请求，会导致网页加载速度慢。另外需要处理js之间错综复杂的依赖关系。为解决上述问题，引入了webpack。

## 什么是WebPack
[webpack ](http://webpack.github.io/)
是前端的一个项目构建工具，它是基于 Node.js 开发出来的一个前端工具。可通过webpack实现前端自动化构建，可以完美实现资源的合并、打包、压缩、混淆等诸多功能。

## webpack的安装
- 全局安装

        npm i webpack -g

- 安装到项目依赖

        npm i webpack --save-dev
  
  以上安装基于nodejs的安装，参考webpack(一)。

## 使用webpack进行项目的构建
- 项目初始化

        npm init
        npm install jquery
	  
     初始化完成后，可看到项目生成package.json文件和node_modules文件夹。

- 1.创建主画面index.html：

		<!DOCTYPE html>
		<html lang="en">
		<head>
		    <meta charset="UTF-8">
		    <title>Title</title>
        <script src="main.js"></script>
		</head>
		<body>
		<ul>
		    <li>测试01......</li>
		    <li>测试02......</li>
		    <li>测试03......</li>
		    <li>测试04......</li>
		</ul>
		
		</body>
		</html>

- 2.创建主程序入口main.js：

   	    import $ from 'jQuery'

		$(function () {
		    $('li:odd').css('backgroundColor', 'yellow')
		    $('li:even').css('backgroundColor', function () {
		        return '#' + 'D97634'
		    })
		})


     运行结果：

        Uncaught SyntaxError: Unexpected identifier

     原因：

        浏览器无法解析ES6的代码，可使用webpack进行处理，webpack默认会把这种高级的语法转换为低级的浏览器能识别的语法。

        webpack ./src/main.js ./dist/bundle.js 

      会出现如下错误，原因是webpack版本过高，语法不兼容导致。可使用如下命令：
![782399670a53a576e7ce2f21645dd868.jpg](https://ww1.yunjiexi.club/2019/08/08/782399670a53a576e7ce2f21645dd868.jpg)

        webpack ./src/main.js --output ./dist/bundle.js --mode development

- 3.修改主画面index.html，画面显示正常

		<!DOCTYPE html>
		<html lang="en">
		<head>
		    <meta charset="UTF-8">
		    <title>Title</title>
        <script src="../dist/bundle.js"></script>
		</head>
		<body>
		<ul>
		    <li>测试01......</li>
		    <li>测试02......</li>
		    <li>测试03......</li>
		    <li>测试04......</li>
		</ul>
		
		</body>
		</html>


## 使用webpack.config.js简化打包过程
- 1.在项目根目录中创建webpack.config.js文件，代码如下：

            const  path = require('path')
            const webpack = require('webpack')

			
			module.exports = {
			    // 入口文件,webpack要对哪个文件进行打包
			    entry: path.join(__dirname,'./src/main.js'),
			    //出口文件
			    output: {
			        //打包后输出文件的目录
			        path:path.join(__dirname,'./dist'),
			        //打包后输出文件的名称
			        filename: "bundle.js"
			    }
			}

        配置完成后，在终端直接执行webpack进行编译打包并在dist目录下生成bundle.js

## 使用webpack实现实时打包
上述过程，只是简化了webpack打包时，不需要进行输入输出参数的设置。每次重新修改代码之后，都需要手动运行webpack打包的命令，重新生成打包编译后的bundle.js文件才能生效。可通过webpack-dev-server来实现代码实时打包编译。

- 1.安装webpack-dev-server

        npm i webpack-dev-server --save-dev


- 2.修改package.json
	
		"scripts": {
		    "dev": "webpack-dev-server"
		}

    此时直接在终端运行npm run dev(webpack-dev-server),可进行编译打包后，点击src后可直接打开index.html。

![4e9792953010a6b9565b0bd0bc196f7c.png](https://ww1.yunjiexi.club/2019/08/08/4e9792953010a6b9565b0bd0bc196f7c.png)


   注意：此时在dist目录下，并未生成bundle.js。此时通过webpack-dev-server生成的bundle.js是存在项目的根目录下基于内存的，因此画面对应的引用路径为：

       <script src="../bundle.js"></script>

- 3.为了解决通过访问localhost:8080直接打开index.html，可修改package.json：

        "scripts": {
        "dev": "webpack-dev-server --open --port 3000 --contentBase src --hot"
         },
         参数说明：
         --open 自动打开浏览器
         --port 设置访问端口，默认为8080
         --contentBase 指定托管的根目录
         --hot  实现热更新

## html-webpack-plugin插件的使用

html-webpack-plugin的作用：

①.根据html模板在内存生成html文件

②.实现自动把bundle.js注入到index.html页面中

-  插件的安装
 
        npm i html-webpack-plugin --save-dev

- webpack.config.js配置

        const  path = require('path')
		const webpack = require('webpack-dev-server')
		const hwp = require('html-webpack-plugin')


		module.exports = {
		    // 入口文件,webpack要对哪个文件进行打包
		    entry: path.join(__dirname,'./src/main.js'),
		    //出口文件
		    output: {
		        //打包后输出文件的目录
		        path:path.join(__dirname,'./dist'),
		        //打包后输出文件的名称
		        filename: "bundle.js"
		    },
		    plugins: [
		        new hwp({
		            title: "首页",
		            //模板路径
		            template: path.resolve(__dirname,'src/index.html'),
		            //自动生成的文件名,自动注入bundle.js
		            filename: "index.html"
		
		        })
		    ]
		}

## 使用webpack打包css文件
- 下载style-loader，css-loader插件

        npm i style-loader css-loader  --save-dev

- main.js引入css文件

        import './css/index.css'

- 修改webpack.config.js
       {test: /\.css$/, use: ['style-loader','css-loader']}



## 使用webpack打包less文件
- 下载style-loader，less-loader插件

        npm i  less-loader  --save-dev

- main.js引入less文件

        import './css/index.less'

- 修改webpack.config.js

        { test: /\.less$/, use: ['style-loader', 'css-loader', 'less-loader'] }


## 使用webpack打包sass文件
- 下载style-loader，sass-loader插件

        npm i sass-loader  --save-dev

- main.js引入scss文件

        import './css/index.scss'

- 修改webpack.config.js

         { test: /\.scss$/, use: ['style-loader', 'css-loader', 'sass-loader'] }

- 完整webpack.config.js

        const  path = require('path')
		const webpack = require('webpack-dev-server')
		const hwp = require('html-webpack-plugin')
		
		module.exports = {
		    // 入口文件,webpack要对哪个文件进行打包
		    entry: path.join(__dirname,'./src/main.js'),
		    //出口文件
		    output: {
		        //打包后输出文件的目录
		        path:path.join(__dirname,'./dist'),
		        //打包后输出文件的名称
		        filename: "bundle.js"
		    },
		    plugins: [
		        new hwp({
		            title: "首页",
		            //模板路径
		            template: path.resolve(__dirname,'src/index.html'),
		            //自动生成的文件名,自动注入bundle.js
		            filename: "index.html"
		
		        })
		    ],
		    //配置第三方模块加载器
		    module: {
		        //配置第三方加载规则
		        rules: [
		            //使用正则表达式，匹配后缀名为.css的文件，按从右向左的顺序依次加载css-loader，style-loader
		            {test: /\.css$/, use: ['style-loader','css-loader']},
		            { test: /\.less$/, use: ['style-loader', 'css-loader', 'less-loader'] },
		            { test: /\.scss$/, use: ['style-loader', 'css-loader', 'sass-loader'] }
		        ]
		    }
		}


以上运行过程中，可能会出现如下错误：
![606fd9a34274306bb7f8a9a8d848410d.png](https://ww1.yunjiexi.club/2019/08/09/606fd9a34274306bb7f8a9a8d848410d.png)

- 解决方法：

        npm install less --save-dev

[![6e7b964346c492c12f35f7c5b534e297.png](https://ww1.yunjiexi.club/2019/08/09/6e7b964346c492c12f35f7c5b534e297.png)](https://www.hualigs.cn/image/nzioC)


- 解决方法：

        npm install node-sass --save-dev
