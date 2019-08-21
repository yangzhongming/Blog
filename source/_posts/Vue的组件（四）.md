---
title: Vue的组件
tags: [前端]
categories: 前端
images: 
date: 2019-08-12 21:00:00
---
## Vue的组件
Vue三种创建组件的方式：

+ 使用Vue.extend创建全局组件

    示例代码:
	
	    <div id="app">
	    	<my-com1></my-com1>
	    </div>
	    <script>
	   
	    var com1 = Vue.extend({
	        template:'<h3>使用 Vue.extend 创建的组件</h3>'
	    })
        // 注：如果使用驼峰命名myCom1，则div标签中的字母间必须用-隔开,如果全为小写字符串，则不需要用-
	    Vue.component('myCom1',com1)
	
	    var vm = new Vue({
	        el: '#app',
	        data: {},
	        methods: {}
	    });
	    </script>

+ 使用Vue.component直接创建
  
    示例代码：

        //注意：template中不能包含同级别标签，不论哪种方式创造的组件，必须有且只能有唯一的一个根元素标签
	    Vue.component('myCom1',Vue.extend({
	        template:'<h3>使用 Vue.compontent 创建的组件</h3>'
	    }))


+ 通过template元素，在script外部创建

	示例代码：

		<div id="app">
			<my-com1></my-com1>
		</div>
		<template id="tmp1">
			<div>
			<h3>通过 template 元素,在外部定义的组件结构</h3>
			</div>
		</template>
		<script> 
			Vue.component('myCom1',{
			template:'#tmp1'
			})
			
			var vm = new Vue({
			el: '#app',
			data: {},
			methods: {}
			});
		</script>

+ 通过 component 元素,在内部定义私有组件

    示例代码：

		<div id="app">
		    <login></login>
		</div>
	     <template id="tmp1">
		    <div>
		        <h3>通过 component 元素,在内部定义私有组件</h3>
		    </div>
		</template>
		<script>
		    var vm = new Vue({
		        el: '#app',
		        data: {},
		        methods: {},
                //注意：不是component
		        components:{
		            login:{template:'#tmp1'}
		        }
		    });
		</script>

+ 组件中的Data数据

	示例代码：

		<script>
	    var vm = new Vue({
	        el: '#app',
	        data: {},
	        methods: {},
	        components:{
	            login:{template:'#tmp1',
                       // 通过方法访问
	                   data:function () {
	                       return {msg: '访问components中的data数据'}
	                   }
	            }
	        }
	    });
		</script>

    说明：

    ①.访问实例中的data可以为一个对象,但是组件中的data必须是一个方法

    ②.访问组件中的data方法内部必须返回的必须是一个对象

+ 组件的切换：v-if=控制实现

	示例代码：

		<div id="app">
		    <a href=""  @click.prevent="flag=true">登录</a>
		    <a href=""  @click.prevent="flag=false">注册</a>
		    <login v-if="flag"></login>
		    <register v-else="flag"></register>
		</div>
	
		<script>
		    Vue.component('login',{
		        template: '<h3>登录组件</h3>'
	    	})
	
		    Vue.component('register',{
		        template: '<h3>注册组件</h3>'
		    })
		
		    var vm = new Vue({
		        el: '#app',
		        data: {
		            flag:false
		        },
		        methods: {},
		    });
		</script>

+ 组件的切换:component标签实现

    示例代码：
  
	    <div id="app">
		    <a href=""  @click.prevent="comName='login'">登录</a>
		    <a href=""  @click.prevent="comName='register'">注册</a>
		    <component :is="comName"></component>
	    </div>
	
	    <script>
		    Vue.component('login',{
		        template: '<h3>登录组件</h3>'
		    })
		
		    Vue.component('register',{
		        template: '<h3>注册组件</h3>'
		    })
		
		    var vm = new Vue({
		        el: '#app',
		        data: {
		            comName:'login'
		        },
		        methods: {},
		    });
	    </script>

+ 组件的切换:动画效果的实现

    实例代码：

	    <style>
	        .v-enter,
	        .v-leave-to {
	            opacity: 0;
	            transform: translateX(150px);
	        }
	
	        .v-enter-active,
	        .v-leave-active {
	            transition: all 0.5s ease;
	        }
        </style>
        ...
	    <transition mode="out-in">
	        <component :is="comName"></component>
	    </transition>
