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
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <blockquote class="layui-elem-quote layui-text">
        学生信息编辑
    </blockquote>

    <div class="layui-form" >

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色编号</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="rno" name="rno" readonly class="layui-input">
                    </label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色名</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="rname" type="text" name="rname"  class="layui-input">
                    </label>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色描述</label>
                <div class="layui-input-inline">
                    <input id="description"  name="description"  class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">预留1</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="yl1" type="text" name="yl1" class="layui-input">
                    </label>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">预留2</label>
                <div class="layui-input-inline">
                    <label>
                        <input id="yl2" type="text" name="yl2"  class="layui-input">
                    </label>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-hide">
            <button type="button" lay-submit="" lay-filter="user-add-save" id="user-add-save" class="layui-btn">
                确认
            </button>
        </div>

    </div>

</div>
<script src="layui/layui.all.js"></script>
</body>
</html>