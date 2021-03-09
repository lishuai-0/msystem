<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/12
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/menuList.css">
    <script src="layui/layui.all.js"></script>
    <style>
        table tr td{
            border: 1px solid #fff;
        }
    </style>
    <script >
        window.onload = function () {
            var rowNumBtn = document.getElementById("rowNumBtn");
            rowNumBtn.onchange = function(){
                document.getElementById("rowNum").value = this.value;
                roleList(1);
            }

            //清空查询内容
            var clearBtn = document.getElementById("clearBtn");
            clearBtn.onclick = function (){
                document.getElementById("rno").value="";
                document.getElementById("rname").value="";
                document.getElementById("description").value="";
            }

            //点击搜索按钮发送查询请求
            var searchBtn = document.getElementById("searchBtn");
            searchBtn.onclick = function () {
                roleList(1);
            }
        }

        function roleList(nowPage) {
            var rno = document.getElementById("rno").value;
            var rname = document.getElementById("rname").value;
            var description = document.getElementById("description").value;
            var rowNum = document.getElementById("rowNum").value;
            location.href = "roleList.do?rno="+rno+"&rname="+rname
                        +"&description="+description+"&nowPage="+nowPage+"&rowNum="+rowNum;
        }


    </script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        /* 重置*/
        *, *:before, *:after {
            box-sizing: border-box;
        }

        /*容器设置*/
        #container {
            counter-reset: counterA;
        }

        /*布局实现*/
        div.row {
            position: relative;
            width: 90%;
            height: 45px;
            counter-increment: counterA;
            /*设置背景色，随机颜色*/
        }
        div.row label {
            width: 30%;
            position: relative;
            display: block;
            float: left;
        }
        div.row label input {
            text-align: center;
            width: 100%;
            height: 45px;
            line-height: 40px;
            background: #7AB893;
            border: none;
            outline: none;
            border: 1px solid #fff;
            color: #fff;
            padding: 4px 10px;
            border-radius: 4px;
            text-indent: 38px;
            transition: all .3s ease-in-out;
        }
        div.row label input ::-webkit-input-placeholder {
            color: transparent;
        }
        div.row label input + span {
            position: absolute;
            left: 0;
            top: 0;
            color: #fff;
            background: #7AB893;
            display: inline-block;
            padding: 7px 4px;
            transform-origin: left center;
            transform: perspective(300px);
            transition: all .3s ease-in-out;
            border-radius: 4px 0 0 4px;
        }
        div.row label input:focus,
        div.row label input:active {
            text-indent: 0px;
        }
        div.row label input:focus ::-webkit-input-placeholder,
        div.row label input:active ::-webkit-input-placeholder {
            color: #f00;
        }
        div.row label input:focus + span,
        div.row label input:active + span {
            background: #478560;
        }
        div.row:nth-child(1) input + span {
            transform-origin: left bottom;
        }
        div.row:nth-child(1) input:focus,
        div.row:nth-child(1) input:active {
            border-radius: 0 4px 4px 0;
            text-indent: 20px;
        }
        div.row:nth-child(1) input:focus + span,
        div.row:nth-child(1) input:active + span {
            transform: rotate(-60deg);
            border-radius: 0 4px 4px 0;
        }


    </style>
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    角色管理
</blockquote>

    <div id='container'>
        <div class='row'>
            <label>
                <input type='number' name="rno" id="rno" value="${requestScope.rno}">
                <span>角色编号</span>
            </label>
            <label>
                <input type='text' name="rname" id="rname" value="${requestScope.rname}">
                <span>角色名称</span>
            </label>
            <label>
                <input type='text' name="description"id="description" value="${requestScope.description}">
                <span>角色描述</span>
            </label>
        </div>
        <button class="layui-btn layui-btn-normal" id="clearBtn">清空查询</button>
        <button class="layui-btn layui-btn-warm" id="searchBtn">点击搜索</button>
    </div>


    <table width="80%" id="roleList"  style=" border-collapse:collapse;border-spacing:0; border:1px  solid  #FFFFFF;">
        <tr align="center" style="background:#50aca2;color: #fff;border-bottom-width: 0;  text-align: center; height: 2.2rem;">
            <td>角色编号</td>
            <td>角色名称</td>
            <td>角色描述</td>
            <td>操作</td>
        </tr>
        <c:forEach var="role" items="${requestScope.roleList}">
            <tr align="center" style="background: #e5efeb; text-align: center;height: 2.2rem;">
                <td>${role.rno}</td>
                <td>${role.rname}</td>
                <td>${role.description}</td>
                <td><a href="">编辑</a>|<a href="">删除</a>|<a href="giveMenuToRoles.do?rno=${role.rno}">分配菜单</a></td>
            </tr>
        </c:forEach>
    </table>
    <table width="80%" id="changeRoleList" >
        <tr>
            <td>
                <select name="" id="rowNumBtn">
                    <c:if test="${rowNum==10}">
                        <option >3</option>
                        <option >5</option>
                        <option selected>10</option>
                    </c:if>
                    <c:if test="${rowNum==5}">
                        <option >3</option>
                        <option selected>5</option>
                        <option >10</option>
                    </c:if><c:if test="${rowNum==3}">
                    <option selected>3</option>
                    <option >5</option>
                    <option >10</option>
                </c:if>
                </select>
            </td>
            <td align="left">第${nowPage}/${sumPage}</td>
            <input type="hidden" value="${nowPage}" id="nowPage">
            <input type="hidden" value="${rowNum}" id="rowNum">
            <td align="right">
                <c:if test="${nowPage>1}">
                    <a href="javascript:roleList(${nowPage-1})">上一页</a>
                </c:if>
                <c:if test="${nowPage<sumPage}">
                    <a href="javascript:roleList(${nowPage+1})">下一页</a>
                </c:if>
                    <a href="javascript:roleList(${sumPage})">尾页</a>
            </td>
        </tr>
    </table>
<script src="js/prefixfree.min.js"></script>
</body>
</html>
