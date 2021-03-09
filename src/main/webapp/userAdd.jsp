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
        #certainPass{
            display: block;
            width: 200px;
            font-size: 12px;
            color: red;
            float: right;
        }
        li input{
            text-align: center;
            float: right;
            height: 30px;
        }
        #subButton{
            float: none;
            text-align: center;
            width: 70px;
            height: 40px;
        }
    </style>
</head>
<body>
    <blockquote class="layui-elem-quote layui-text">
        新增用户
    </blockquote>
    <form action="userAdd.do" method="post" id="userAddForm" class="layui-form">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="upass" id="newPass" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="oldPass" required lay-verify="required" placeholder="请输入确认密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux" id="certainPass"></div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">真实姓名：</label>
            <div class="layui-input-block">
                <input type="text" name="trueName" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄：</label>
            <div class="layui-input-block">
                <input type="text" name="age" required  lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
            </div>
        </div>
<!--        <ul>-->
<!--            <li>用户名：    <input type="text" required name="uname"></li>-->
<!--            <li>密码：      <input type="password" required name="upass" id="oldPass"></li>-->
<!--            <li>确认密码：   <span id="certainPass"></span><input type="password" required id="newPass"></li>-->
<!--            <li>真实姓名：   <input type="text" required name="trueName"></li>-->
<!--            <li>年龄：      <input type="number" required name="age"></li>-->
<!--            <li>性别：      <input type="text" required name="sex" list="sexList">-->
<!--                <datalist id="sexList">-->
<!--                    <option value="男"></option>-->
<!--                    <option value="女"></option>-->
<!--                </datalist>-->
<!--            </li>-->
<!--            <li> 联系电话：<input type="text" required name="phone"></li>-->
<!--            <li> <button id="subButton" class="layui-btn layui-btn-normal">提交</button></li>-->
<!--        </ul>-->
    </form>
    <script>
        window.onload = function () {
            document.getElementById("reset").click();
            var newPass = document.getElementById("newPass");

            var checkPass = function (){
                var newPass = document.getElementById("newPass");
                var oldPass = document.getElementById("oldPass");
                var sertainPass = document.getElementById("certainPass");
                if (oldPass.value!=newPass.value){
                    sertainPass.innerText = "前后密码不一致";
                }else{
                    sertainPass.innerText = "";
                }
            }
            setInterval(function () {
                checkPass();
            },500)
            // //绑定button提交事件，提交表单
            // var subButton = document.getElementById("subButton");
            // subButton.onclick = function () {
            //     var oldPass = document.getElementById("oldPass");
            //     var newPass = document.getElementById("newPass");
            //     if (oldPass.value!=newPass.value){
            //         window.alert("     密码不一致");
            //     }else{
            //         var subForm = document.getElementById("userAddForm");
            //         subForm.submit();
            //     }
            // }
        }

    </script>
</body>
</html>
