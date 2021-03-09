<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/16
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <title></title>
    <style>
        li{
            color: #8D8D8D;
            font-size: 20px;
            font-family: "Helvetica Neue", Helvetica, "PingFang SC", Tahoma, Arial, sans-serif;
            list-style: none;
            width: 150px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            border: 1px solid #cfc;
        }
        li:hover{
            cursor: pointer;
        }
        #left{
            border: 1px solid #cccccc;
            float: left;
            width:35% ;
            height: 80%;
        }
        #middle{
            float: left;
            width: 20%;
            height: 80%;
        }
        #middle button{
            line-height: 15%;
            width: 50%;
            height: 10%;
            margin:30% 40%;
        }
        #right{
            float: right;
            border: 1px solid #cccccc;
            width: 35%;
            height: 80%;
        }
        .active{
            font-weight: bold;
            color: #ff4400;
        }
    </style>
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script>

    $(function () {

        var uno = $('input')[0].value;
        //给所有的li增加点击事件
        function liactive(){
            var $id = $(this).parent().parent().attr('id');
            if($id=='left'){
                $('#right .active').attr('class','');
            }else{
                $('#left .active').attr('class','');
            }
            if(this.class=='active'){
                $(this).attr('class','');
                return;
            }
            $(this).attr('class','active');
        }

        //移动事件
        //将li通过左移left或者右移right移动到另一面
        function move(position){
            if (position=='left'){
                $('#right .active').appendTo($('#left ul'));
                $('#right .active').remove();
            }else{
                $('#left .active').appendTo($('#right ul'));
                $('#left .active').remove();
            }
            $('.active').attr('class','');
        }


        //给左移按钮增加点击事件
        $('#moveToLeft').click(function(){
            move('left');
        })
        //给右移按钮增加点击事件
        $('#moveToRight').click(function(){
            move('rigth');
        })


        //增加提交保存事件
        $('#saveBtn').click(function () {
            var rnos = '';
            $('#left').children('ul').children('li').each(function (i,e) {
               rnos=rnos+$(e).attr('rno')+',';
            })
            $.post('saveRoleForUser.do',{'rnos':rnos,'uno':uno},function(){
                alert('保存成功');
            })

        })






        //向左侧添加已经选择的角色
        $.post('selectRoleWithUser.do',{'uno':uno},function (data) {
            var roles = data.jsonObject;
            var $ul = $('<ul>');
            for (var i=0;i<roles.length;i++){
                var $li = $('<li rno="'+roles[i].rno+'">'+roles[i].rname+'</li>');
                $li.click(liactive);
                $ul.append($li);
            }
            $('#left').append($ul);
        },'json')

        //右侧添加未选择的角色
        $.post('selectNoRoleWithUser.do',{'uno':uno},function (data) {
            var roles = data.jsonObject;
            var $ul = $('<ul>');
            for (var i=0;i<roles.length;i++){
                var $li = $('<li rno="'+roles[i].rno+'">'+roles[i].rname+'</li>');
                $li.click(liactive);
                $ul.append($li);
            }
            $('#right').append($ul);
        },'json')
    })


</script>
<body>
<div class="layui-elem-quote layui-text" style="text-align: center;font-size: 24px;">
    为用户分配角色
</div>
<input type="hidden" value="${requestScope.uno}" name="uno">
<div id="left">
    <div class="layui-elem-quote layui-text" style="text-align: center;font-size: 24px;">用户已有角色</div>
</div>
<div id="middle">
    <button id="moveToRight" class="layui-btn">&gt;&gt;</button>
    <button id="moveToLeft" class="layui-btn layui-btn-normal">&lt;&lt;</button>
    <button id="saveBtn" class="layui-btn layui-btn-warm">提交保存</button>
</div>
<div id="right">
    <div class="layui-elem-quote layui-text" style="text-align: center;font-size: 24px;">用户未有角色</div>
</div>
</body>
</html>
