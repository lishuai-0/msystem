<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/12/22
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>carousel模块快速使用</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-carousel" id="test1">
    <div carousel-item  style="width:100%;height:100%;" >
        <div><img src="/images/4.jpg" ></div>
        <div><img src="/images/5.jpg" alt=""></div>
        <div><img src="/images/6.jpg" alt=""></div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->

<script src="/layui/layui.all.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height:'100%'
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
</body>
</html>