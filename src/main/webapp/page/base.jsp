<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020-11-28
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  autoFlush="true" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div class="layui-container" style="width: 100%;">
    <blockquote class="layui-elem-quote layui-text">
        库存管理：
    </blockquote>

    <table class="layui-hide" id="base" lay-filter="base_filter"></table>

</div>

<script src="../layui/layui.all.js"></script>
<script type="text/html" id="base_toolbar">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script type="text/html" id="stu_toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
        <button class="layui-btn layui-btn-sm" lay-event="import">导入</button>
    </div>
</script>

<script>
    layui.use(['table', 'layer', 'form'], function () {
        const table = layui.table;
        const layer = layui.layer;
        const $ = layui.$;

        const tableIns = table.render({
            elem: '#base'
            , url: '/baseList.do'
            ,page: true
            ,limits:[5,10]
            , cellMinWidth: 80
            , toolbar: '#stu_toolbarDemo'
            , defaultToolbar: ['filter', 'print', 'exports']
            , response: {
                statusCode: 200
            }
            , cols: [[
                {field: 'bno', title: '仓库编号', sort: true}
                , {field: 'bname', title: '仓库名称'}
                , {field: 'adress', title: '仓库地址'}
                , {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#base_toolbar'}
            ]]
        });

        table.on('tool(base_filter)', function (obj) {
            const data = obj.data; //获得当前行数据
            const layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

            if (layEvent === 'detail') {
                //查看
                layer.open({
                    type: 2,
                    content: '/page/detailBase.jsp',
                    area: ['700px', '300px'],
                    btn: '确认',
                    title: false,
                    yes: function (index, layero) {
                        layer.close(index);
                    },
                    success: function (layero, index) {
                        render_form(layero, index, data)
                    }
                });
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    // obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    //向服务端发送删除指令
                    $.ajax({
                        url: '/deleteBase.do',
                        type: 'POST',
                        data: {'bno': data.bno},
                        success: function (res) {
                            console.log(data.bno);
                            var temp = $.parseJSON(res);
                            layer.close(index);
                            if (temp.code === 200) {
                                layer.msg('删除成功');
                                tableIns.reload();
                            } else {
                                layer.msg('删除失败');
                            }
                        },
                        error: function (error) {
                            layer.close(index)
                            layer.msg('http请求错误')
                        }
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                layer.open({
                    type: 2,
                    content: '/page/editBase.jsp',
                    area: ['700px', '400px'],
                    title: false,
                    btn: ['确定', "取消"],
                    yes: function (index, layero) {
                        const iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'user-add-save'
                            , submit = layero.find('iframe').contents().find('#' + submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            const field = data.field; //获取提交的字段
                            $.ajax({
                                url: '/baseChange.do',
                                type: 'POST',
                                data: {'bno':field.bno,'bname':field.bname,'adress':field.adress},
                                success: function (res) {
                                    var temp = $.parseJSON(res)
                                    if (temp.code == 200) {
                                        tableIns.reload();
                                        layer.close(index);
                                        layer.msg('修改成功');
                                    } else {
                                        layer.msg('修改失败');
                                    }
                                },
                                error: function (error) {
                                    layer.msg('修改失败');
                                }
                            });
                        });

                        submit.trigger('click');
                    },
                    success: function (layero, index) {
                        render_form(layero, index, data)
                    }
                });
            }
            function render_form(layero, index, data) {
                const body = layer.getChildFrame('body', index);
                body.find('#bno').val(data.bno);
                body.find('#bname').val(data.bname);
                body.find('#adress').val(data.adress);
            }
        });

        table.on('toolbar(base_filter)', function (obj) {
            // var checkStatus = table.checkStatus(obj.config.id);

            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 2,
                        content: '/page/addBase.jsp',
                        area: ['700px', '400px'],
                        title: false,
                        btn: ['确定', "取消"],
                        yes: function (index, layero) {
                            const iframeWindow = window['layui-layer-iframe' + index]
                                , submitID = 'user-add-save'
                                , submit = layero.find('iframe').contents().find('#' + submitID);

                            //监听提交
                            iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                                const field = data.field; //获取提交的字段
                                $.ajax({
                                    url: '/baseAdd.do',
                                    type: 'POST',
                                    data: {'bno':field.bno,'bname':field.bname,'adress':field.adress},
                                    success: function (res) {
                                        var temp = $.parseJSON(res);
                                        if (temp.code === 200) {
                                            tableIns.reload();
                                            layer.close(index);
                                            layer.msg('添加成功');
                                        } else {
                                            layer.msg('添加失败,编号已存在');
                                        }
                                    },
                                    error: function (error) {
                                        layer.msg('添加失败');
                                    }
                                });
                            });

                            submit.trigger('click');
                        },
                    });
                    break;
                case 'import':
                    layer.msg('导入');
                    break;
            };
        });
    })

</script>

</body>
</html>
