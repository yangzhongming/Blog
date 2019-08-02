---
title: 最受欢迎的文章
comments: false
keywords: top,文章阅读量排行榜
description:
---
<div id="top"></div>
<script src="https://cdn1.lncld.net/static/js/av-core-mini-0.6.4.js"></script>
<script>AV.initialize("GCYI5jsgNpmM3Suz4ofv8S5p-gzGzoHsz", "cWjcGdxjdwcqmlDzINRRbUE4");</script>
<script type="text/javascript">
  var time=0
  var title=""
  var url=""
  var query = new AV.Query('Counter');
  query.notEqualTo('id',0);
  query.descending('time');
  query.limit(1000);
  query.find().then(function (todo) {
    for (var i=0;i<1000;i++){
      var result=todo[i].attributes;
      time=result.time;
      title=result.title;
      url=result.url;
      var content="<a href='"+"http://www.ejgo.top"+url+"'>"+title+"</a>"+"<br />"+"<font color='#555'>"+"阅读次数："+time+"</font>"+"<br /><br />";
      document.getElementById("top").innerHTML+=content
    }
  }, function (error) {
    console.log("error");
  });
</script>

<style>.post-description { display: none; }</style>