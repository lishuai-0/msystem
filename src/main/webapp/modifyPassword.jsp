<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020-11-28
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        .layui-container{
            background-color: #ffffff;
            padding-bottom: 20px;
        }

    </style>
</head>
<body>
<div class="layui-container">
    <blockquote class="layui-elem-quote layui-text">
        修改密码
    </blockquote>

    <form class="layui-form" action="" method="post">
        <c:if test="${ empty (sessionScope.loginUser)}">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required id="name" value="" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
        </c:if>
        <c:if test="${ not empty (sessionScope.loginUser)}">
                    <input type="hidden" name="title"  id="name" value=${sessionScope.loginUser.uname}>
        </c:if>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱验证码</label>
            <div class="layui-input-inline">
                <input type="password" name="msg" required lay-verify="required" id="msgText" placeholder="请输入验证码" autocomplete="off" class="layui-input">
            </div>
            <input type="button" class="layui-form-mid layui-word-aux layui-btn layui-btn-warm" value="点击发送验证码" id="sendMsg" style="color: #ffffff"></input>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" id="pass1" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请再次的输入密码" id="pass2" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux" id="msg"></div>
        </div>

    </form>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="subBtn">立即提交</button>
            <c:if test="${ empty (sessionScope.loginUser)}">
                <a class="layui-btn" id="" href="/index.jsp">返回登录</a>
            </c:if>

        </div>
    </div>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script>
        window.onload = function () {
            //监听提交
            const subBtn  = $("#subBtn");
            const sendMsg = $("#sendMsg");
            const msg = $("#msg");
            const pass1 = $("#pass1");
            const pass2 = $("#pass2");
            const name = document.getElementById("name");
            var checkPass = function (){
                if (pass1.val()!=pass2.val()){
                    msg.val("前后密码不一致");
                }else{
                    msg.val("");
                }
            }
            setInterval(function () {
                checkPass();
            },500)
            sendMsg.bind("click",function(){
                if (name.value.replace(/\s*/g,"")!=""&&name.value!=undefined){//通过正则去除字符串
                    var t = 60;
                    sendMsg.val(t+"s后重新发送");
                    sendMsg.attr("disabled",true);
                    subBtn.unbind('click');
                    subBtn.bind("click",send);
                    $.ajax({
                        url: '/getMsg.do',
                        type: 'POST',
                        data: {'name': $(name).val()},
                        success: function (res) {
                        },
                        error: function (error) {
                        }
                    })

                    const t1 = setInterval(function () {
                        t = t-1;
                        if (t!=1){
                            sendMsg.val(t+"s后重新发送");

                            sendMsg.removeAttr("disabled");
                        }else {
                            sendMsg.val("重新发送");
                            sendMsg.removeAttr("disabled");
                            clearInterval(t1);
                        }
                    },1000)
                }else{
                    alert("请输入用户名");
                    return;
                }

            })
            subBtn.bind("click",sendPre)

            function sendPre() {
                alert("请点击发送验证码");
            }

            function send() {
                const msgText = $("#msgText");
                if (msgText.val().length<6){
                    alert("请输入六位验证码");
                }else if (name==undefined||(name!=undefined&&$(name).val()!=undefined)){
                    if (pass1.val()!=pass2.val()){
                        alert("前后密码不一致");
                    }else{
                        $.ajax({
                            url: '/modifyPassword.do',
                            type: 'POST',
                            data: {'name': $(name).val(),'msg': msgText.val(),'password':pass1.val()},
                            success: function (res) {
                               if (res=="/index.jsp"){
                                   window.parent.window.location.href = res;
                               }else {
                                   alert(res);
                               }
                            },
                            error: function (error) {
                            }
                        })
                    }
                }

            }
        }


    </script>



</div>
<script src="/layui/layui.all.js"></script>
</body>
</html>