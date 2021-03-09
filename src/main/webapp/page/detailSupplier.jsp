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
        供应商详细信息
    </blockquote>

    <div class="layui-form" >

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">供应商编号</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="sno" name="sno" readonly required class="layui-input">
                    </label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">供应商名称</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="sname" type="text" name="sname" readonly required class="layui-input">
                    </label>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">通讯地址</label>
                <div class="layui-input-inline">
                    <input id="adress"  name="adress" readonly required  class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input id="phone"  name="phone" readonly required  class="layui-input">
                </div>
            </div>
        </div>

    </div>

</div>
<script src="../layui/layui.all.js"></script>
</body>
</html>