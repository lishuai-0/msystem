
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <style type="text/css">
        p a{
            font-size: 24px;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    window.onload = function() {


        //获取每一行tr
        var trs = document.getElementById("userBody").getElementsByTagName("tr");
        for(var i=0;i<trs.length;i++){
            if (i%2==0){
                trs[i].style.background = "#ccffcc";
            }else{
                trs[i].style.background = "#cfcfcf";
            }
            trs[i].onclick = function (){
                var inputbtn = this.getElementsByTagName("input")[0];
                inputbtn.checked = !inputbtn.checked;
            }
        }
        for(var i=0;i<trs.length;i++){

            trs[i].onmouseenter = function(){
                var oldColor = this.style.background;
                this.style.background = "#ff4400";
                this.onmouseleave = function(){
                    this.style.background = oldColor;
                }
            }
        }
        //绑定鼠标选定事件
        var par = document.getElementsByClassName("pcheckbox");
        var son = document.getElementsByClassName("scheckbox");
        for(var i=0;i<son.length;i++){
            son[i].onclick = function (e){
                window.event? window.event.cancelBubble = true : e.stopPropagation();
            }
        }
        //绑定鼠标全选事件
        par[0].onclick = function(){
            var state = this.checked;
            for(var i=0;i<son.length;i++){
                son[i].checked = state;
            }

        }
    }
    function certainDel(uno){
        var bo = confirm("是否确认删除");
        if(!bo)return;
        location.href = "userDelete.do?uno="+uno;
    }

    function deleteList(){
        var uno = "";
        var son = document.getElementsByClassName("scheckbox");
        for(var i=0;i<son.length;i++){
             if(son[i].checked){
                uno = uno+son[i].id+"-";
             }
        }
        if(uno==""){
            alert("请选择要删除的用户");
            return;
        }

        var f = confirm("是否确认删除");
        if (!f)return;
        location.href = "usersDelete.do?unos="+uno;
    }
</script>
    <blockquote class="layui-elem-quote layui-text">
    用户列表
    </blockquote>
    <p align="center">
        <a href="userAdd.jsp" class="layui-btn">新建用户</a>
        <a href="javascript:deleteList()" class="layui-btn layui-btn-danger">批量删除</a>
        <a href="uploadFile.jsp" class="layui-btn">批量导入</a>
    </p>
    <table align="center"border="1" cellspacing="0" id="userList" class="layui-table">
        <thead>
            <tr>
                <th><input type="checkbox" class="pcheckbox"></th>
                <th>用户编号</th>
                <th>用户名</th>
                <th>真实姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>联系电话</th>
                <th>email</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="userBody" >
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><input type="checkbox" class="scheckbox" id="${user.uno}"></td>
                    <td>${user.uno}</td>
                    <td>${user.uname}</td>
                    <td>${user.trueName}</td>
                    <td>${user.age}</td>
                    <td>${user.sex}</td>
                    <td>${user.phone}</td>
                    <td>${user.email}</td>
                    <td>
                        <a href="userEdit.do?uno=${user.uno} " class="layui-btn layui-btn-xs" >编辑</a>
                        <a href="javascript:certainDel(${user.uno})" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
                        <a href="giveRoleToUser.do?uno=${user.uno}" class="layui-btn layui-btn-primary layui-btn-xs">分配角色</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
