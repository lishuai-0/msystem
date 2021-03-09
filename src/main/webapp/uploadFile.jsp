<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/4
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
</head>
<body>
    <blockquote class="layui-elem-quote layui-text">
        批量导入
    </blockquote>
    <form action="uploadFile.do" method="post" enctype="multipart/form-data">
        <input type="file" name="excel" value="请选择excel文件">
        <input type="submit" value="上传" class="layui-btn layui-btn-warm">
        <br>
        <a href="fileModelDownload.do" class="layui-btn  ">模板下载</a>
    </form>
</body>
</html>
