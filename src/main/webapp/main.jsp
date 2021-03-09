<%@ page import="com.bug1024.msystem.coma.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--suppress ALL -->
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>仓库管理系统</title>
	<link rel="stylesheet" href="layui/css/layui.css">
	<script  src="js/jquery-3.5.1.min.js"></script>
	<script >
		$(function () {
			$.post("getMenusByUno.do",{'uno':${sessionScope.loginUser.uno}},function (data) {
				console.log("获取菜单成功");
				var menus = data.jsonObject;
				var $position = $('#left-menu');
				//按照层级关系添加元素放入页面
				showMenu(-1,$position);
				function showMenu(pno,$position){
					var $ul = $('<ul class="layui-nav layui-nav-tree " lay-filter="test">');
					for(var i=0;i<menus.length;i++){
						if(pno==menus[i].pno){//没有子菜单
							if(menus[i].mhref!=undefined){
								menus[i].mhref = '<a href="'+menus[i].mhref+'" target="body">'+menus[i].mname+'</a>';
								var $li = $('<li class="layui-nav-item" ></li>');
								$li.append($(menus[i].mhref));
							}else{//有子菜单
								var $li = $('<li class="layui-nav-item"></li>');
								var $dl = $('<dl class="layui-nav-child"></dl>');
								$li.append($('<a href="javascript:;">'+menus[i].mname+'</a>'))
								showSon(menus[i].mno,$dl);
								$li.append($dl);

							}
							$ul.append($li);
							$position.append($ul);
						}
					}
				}
				function showSon(pno,$position) {
					for(var i=0;i<menus.length;i++){
						if(pno==menus[i].pno){
							menus[i].mhref='<a href="'+menus[i].mhref+'" target="body">'+menus[i].mname+'</a>';
							var $dl = $('<dd></dd>');
							$dl.append($(menus[i].mhref));
							$position.append($dl);
						}
					}
				}
				//需要重新加载的js文件列表
				$("<scri"+"pt >"+"</scr"+"ipt>").attr({src:'layui/layui.all.js',type:'text/javascript'}).appendTo($('body'));

			},'json')
		})

	</script>

</head>



<body class="layui-layout-body" style="background-image: url(images/111.jpg);">

<div class="layui-layout layui-layout-admin">
	<div class="layui-header" style="width: 100%">
		<a class="layui-logo" href="/main.jsp">仓库管理系统</a>



		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
		</ul>

		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<iframe frameborder="no"   border="0" marginwidth="0" marginheight="0" width=298 height=52 src="//music.163.com/outchain/player?type=2&id=558071673&auto=1&height=32"></iframe>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					<c:if test="${not empty (sessionScope.loginUser)}">
						${sessionScope.loginUser.uname}
					</c:if>
				</a>
				<dl class="layui-nav-child">
					<dd><a href="/modifyPassword.jsp" target="body">修改密码</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="quit.do">退了</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll" id="left-menu">
			<ul class="layui-nav layui-nav-tree" lay-filter="test">
				<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
			</ul>
		</div>
	</div>

	<div class="layui-body">
        <iframe name="body" src="" frameborder="0" id="r_iframe" style="width: 100%;height: 100%;margin: 0;background-image: url(images/2.jpg) ;background-size: 100% 100%">
		</iframe>
		<!-- 内容主体区域 -->
        <table id="demo" lay-filter="test"></table>
	</div>

	<div class="layui-footer">
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=47440880&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:47440880:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>

		<!-- 底部固定区域 -->

	</div>
</div>
</body>
<!--<script src="layui/layui.all.js">-->

<!--</script>-->
</html>