<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/1
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        form{
            width: 80%;
            margin: auto;
        }
        form ul{
            width: 50%;
            margin: 30px auto;
        }
        ul li{
            height: 50px;
        }

        li input{
            text-align: center;
            float: right;
            height: 30px;
        }

    </style>
</head>
<body>
    <blockquote class="layui-elem-quote layui-text">
        用户编辑
    </blockquote>
<form action="userUpdate.do" method="post" id="userAddForm">
    <ul>
        <li><input type="hidden" name="uno" value="${user.uno}"></li>
        <li>用户名：    <input type="text" required name="uname" value="${user.uname}"></li>
        <li>真实姓名：   <input type="text" required name="trueName" value="${user.trueName}"></li>
        <li>年龄：      <input type="number" required name="age" value="${user.age}"></li>
        <li>性别：      <input type="text" required name="sex" list="sexList">
            <datalist id="sexList">
                <option value="男"></option>
                <option value="女"></option>
            </datalist>
        </li>
        <li> 联系电话：<input type="text" required name="phone" value="${user.phone}"></li>
        <li> <input type="submit" value="提交"></li>
    </ul>
</form>
</body>
</html>
