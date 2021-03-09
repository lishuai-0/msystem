<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/13
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <style>
        li{
            list-style: none;
        }
        li:hover{
            cursor: pointer;
        }
        #active{
            background-color: #00FF00;
        }
        li{
            margin-left: 50px;
            margin-top: 10px;
        }
        li span{
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            line-height: 30px;
        }
        .img-open{
            display: inline-block;
            width: 14px;
            height: 14px;
            background: url("images/open.png") no-repeat;
        }
        .img-close{
            display: inline-block;
            width: 14px;
            height: 14px;
            background: url("images/close.png") no-repeat;
        }
        input {
            text-align: center;
            width: 200px;
            height: 35px;
            line-height: 40px;
            background: #7AB893;
            border: none;
            outline: none;
            border: 1px solid #fff;
            color: #fff;
            border-radius: 4px;
            text-indent: 38px;
            transition: all .3s ease-in-out;
        }
        input ::-webkit-input-placeholder {
            color: transparent;
        }
        input{
            left: 0;
            top: 0;
            color: #fff;
            background: #7AB893;
            display: inline-block;
            transform-origin: left center;
            transform: perspective(300px);
            transition: all .3s ease-in-out;
            border-radius: 4px 0 0 4px;
        }
        input:focus,
        input:active {
            text-indent: 0px;
        }
        input:focus ::-webkit-input-placeholder,
        input:active ::-webkit-input-placeholder {
            color: #f00;
        }
        input:focus,
        input:active {
            border-radius: 0 4px 4px 0;
            text-indent: 20px;
        }
    </style>
    <script >

        $(function () {

            $.post(
                "menuList.do",
                {username:"zs5",password:"123"},
                function (data) {

                    var menus = data.jsonObject;
                    var $position = $('#wrapper');
                    //按照层级关系添加元素放入页面
                    showMenu(-1,$position);
                    addIcon();
                    function showMenu(pno,$position){
                        var $ul = $('<ul>');
                        for(var i=0;i<menus.length;i++){
                            if(pno==menus[i].pno){
                                var $li = $('<li>');
                                var $span = $('<span mno="'+menus[i].mno+'">'+menus[i].mname+'</span>');
                                $li.append($span);
                                $ul.append($li);
                                $position.append($ul);
                                showMenu(menus[i].mno,$li);
                                $span.dblclick(liDbc);
                                $span.click(spanc);
                            }

                        }
                    }

                 },
                 'json'
            );
        })
        function liDbc(){
            $(this).next().toggle(1000);
        }

        //给有子集菜单的元素添加icon
        function  addIcon(){
            $('.img-open').remove();
            $('.img-close').remove();
            var $span = $('<spanc class="img-open"></span>');
            $('ul').parent('li').prepend($span);
            $('.img-open').click(function () {
                if($(this).attr('class')=='img-close'){
                    $(this).attr('class','img-open');
                }else{
                    $(this).attr('class','img-close');
                }
                $(this).next().next('ul').toggle(1000);
            });

        }

        function spanc(){
                $("#active").removeAttr('id');
                $(this).attr('id','active');
        }

        //向服务器发送一个新增用户
        function addMenu(){
            var mname = $('#addLi').children()[0].value;
            var mhref = $('#addLi').children()[1].value;
            var mtarget = $('#addLi').children()[2].value;
            var pno = $('#addLi').children()[3].value;
            if(mname==""||mtarget==""){
                alert('请将信息填写完整');
                return ;
            }
            $.post(
                "addMenu.do",
                {'mname':mname,'mhref':mhref,'mtarget':mtarget,'pno':pno},
                function (data) {
                    var $ul = $('#addLi').parent();
                    var menus = data.jsonObject;
                    var $li = $('<li>');
                    var $span = $('<span id="img-open"></span><span mno="'+menus.mno+'">'+menus.mname+'</span>');
                    $li.append($span);
                    $ul.append($li);
                    $span.dblclick(liDbc);
                    $span.click(spanc);
                    addIcon();
                    $('#addLi').remove();
                },
                'json'
            )

        }

        //添加根菜单
        function createRootMenu(){
            $('#addLi').remove();
            var $li = $('<li id="addLi">');
            $li.append($('<input type="text" placeholder="菜单名称" name="mname">' +
                '         <input type="text" placeholder="菜单请求" name="mhref">' +
                '         <input type="text" placeholder="菜单位置" name="mtarget">' +
                '         <input type="hidden" value="-1" name="pno">' +
                '         <button id="addMenu" class="layui-btn layui-btn-warm">提交</button>'));

            var $ul = $('#wrapper').children("ul:first");
            if($ul.length==0){
                $ul = $('<ul>');
                $('#active').parent().append($ul);
            }
            $ul.append($li);
            $('#addMenu').click(addMenu);
        }


        //添加创建用户子菜单
        function createSonMenu(){
            $('#addLi').remove();
            var pno = $('#active').attr('mno');
            var $li = $('<li id="addLi">');
            $li.append($('<input type="text" placeholder="菜单名称" name="mname">' +
                '         <input type="text" placeholder="菜单请求" name="mhref">' +
                '         <input type="text" placeholder="菜单位置" name="mtarget">' +
                '         <input type="hidden" value="'+pno+'" name="pno">' +
                '         <button id="addMenu" class="layui-btn layui-btn-warm">提交</button>'));

            var $ul = $('#active').next();
            if($ul.length==0){
                $ul = $('<ul>');
                $('#active').parent().append($ul);
            }
            $ul.append($li);
            $('#addMenu').click(addMenu);
        }
        function editMenu(){

        }
        function deleteMenu(){
            var mno = $('#active').attr('mno');
            $.post(
                'deleteMenu.do',
                {'mno':mno},
                function(){
                    if($('#active').parent().next().length==0){
                        $('#active').parent().parent().remove();
                    }
                    $('#active').parent().remove();
                    addIcon();
                }
            )
        }
    </script>
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    菜单管理
</blockquote>
<a href="javascript:createRootMenu()" class="layui-btn" lay-event="edit">新建根菜单</a>
<a href="javascript:createSonMenu()" class="layui-btn layui-btn-warm">新建子菜单</a>
<a href="javascript:editMenu()" class="layui-btn " lay-event="edit">编辑菜单</a>
<a href="javascript:deleteMenu()" class="layui-btn layui-btn-danger">删除菜单</a>
    <div id="wrapper">
    </div>
</body>
</html>
