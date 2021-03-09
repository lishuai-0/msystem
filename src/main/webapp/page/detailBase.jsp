<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020-11-28
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <blockquote class="layui-elem-quote layui-text">
        仓库详细信息
    </blockquote>

    <div class="layui-form" >

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">仓库编号</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="bno" name="bno" readonly required class="layui-input">
                    </label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">仓库名称</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="bname" type="text" name="bname" readonly required class="layui-input">
                    </label>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">仓库地址</label>
                <div class="layui-input-inline">
                    <input id="adress"  name="adress" readonly required  class="layui-input">
                </div>
            </div>
        </div>

    </div>

</div>
<script src="../layui/layui.all.js"></script>
</body>
</html>