<%--
  Created by IntelliJ IDEA.
  User: 47440
  Date: 2020/9/17
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
</head>
<style>

    ul li{
        margin-top: 10px;
        margin-left: 50px;
        list-style: none;
    }
    input{
        margin: 0px;
        padding: 0px;
        width: 15px;
        height: 15px;
    }
</style>
<script src="js/jquery-3.5.1.min.js"></script>
<script>
    $(function () {
        var $rno = $('input:first').attr('value');
        $.post(
            "menuList.do",
            {username:"zs5",password:"123"},
            function (data) {

                var menus = data.jsonObject;
                var $position = $('#menuBox');
                //按照层级关系添加元素放入页面
                showMenu(-1,$position);
                function showMenu(pno,$position){
                    var $ul = $('<ul>');
                    for(var i=0;i<menus.length;i++){
                        if(pno==menus[i].pno){
                            var $li = $('<li>');
                            var $input = $('<input type="checkbox">');
                            var $span = $('<span mno="'+menus[i].mno+'" pno = "'+menus[i].pno+'">'+menus[i].mname+'</span>');
                            $input.prop('checked',false);
                            $li.append($input);
                            $li.append($span);
                            $ul.append($li);
                            $input.click(function () {
                                var checked = $(this).prop('checked');
                                selectedParent($(this),checked);
                                selectedSon($(this),checked);
                            })
                            $position.append($ul);
                            showMenu(menus[i].mno,$li);
                        }

                    }
                }

                //给按钮绑定提交事件
                $('#saveMenusForRole').click(function () {
                    var rno = $rno
                    var mnos = '';
                    $('input:checked').each(function (i,e) {
                        mnos = mnos+$(e).next().attr('mno')+",";
                    });
                    $.post('saveMenusForRole.do',{'rno':$rno,'mnos':mnos},function () {
                        alert("保存成功");
                    })

                })

                //选中已有权限
                $.post('selectMenusByRoleId.do',{'rno':$rno},function (data) {
                    var menus = data.jsonObject;
                    $('li').each(function (i,e) {
                        var mno = $(e).children('span:first').attr('mno');
                        for (var i=0;i<menus.length;i++){
                            if(mno==menus[i].mno){
                                $(e).children('input').prop('checked',true);
                            }
                        }
                    })
                },'json');
            },
            'json'
        );

    })

    //选中他以及他的父菜单
    function selectedParent(e,checked){
        //选中自己
        e.prop('checked',checked);
        if(!checked){
            var pno = e.next().attr('pno');
            if(pno==-1){
                return;
            }
            var flag=1;
            e.parent().parent().children('li').children('input').each(function (i,ev) {
                if ($(ev).prop('checked')){
                    flag=0;
                }
            });
            if(flag==1){
                selectedParent(e.parent().parent().prev().prev(),checked);
            }
        }else{
            var pno = e.next().attr('pno');
            if(pno==-1){
                e.prop('checked',checked);
                return;
            }
            //选中所属的父菜单
            selectedParent(e.parent().parent().prev().prev(),checked);
        }
    }
    function selectedSon(e,checked){
        var $li = e.next().next().children('li');
        if($li==undefined || $li.length==0){
            return ;
        }
        $li.children('input').prop('checked',checked);
        selectedSon($li.children('input'),checked);
    }


</script>
<body>
<blockquote class="layui-elem-quote layui-text">
    为角色分配菜单
</blockquote>
    <input type="hidden" value="${requestScope.rno}">
    <button id="saveMenusForRole">提交保存</button>
    <div id="menuBox">

    </div>
</body>
</html>
