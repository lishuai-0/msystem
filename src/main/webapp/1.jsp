<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>第一个 ECharts 实例</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>
<script src="/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    window.onload = function () {

        $.ajax({
            url:'/stockList.do'
            ,type: 'POST'
            ,success: function (res) {

            },
            error: function (error) {
                layer.close(index)
                layer.msg('http请求错误')
            }
        })

        function draw(option) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    }
</script>

</body>
</html>