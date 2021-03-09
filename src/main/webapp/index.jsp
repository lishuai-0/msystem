<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <title>扁平简洁的登录页面演示_dowebok</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<script src="layui/layui.all.js"></script>
<script>
    layui.use('layer', function () {
        const table = layui.table;
        const layer = layui.layer;

        });

</script>
<body onload="createCode()">
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
                    <span class="login100-form-title-1">登 录</span>
                </div>

                <form class="login100-form validate-form" action="login.do" method="post">
                    <div class="wrap-input100 validate-input m-b-26" data-validate="用户名不能为空">
                        <span class="label-input100">用户名</span>
                        <input class="input100" type="text" name="uname" id="msg" placeholder=${mesg=="0"?"用户名或密码错误":"请输入用户名"}>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-18" data-validate="密码不能为空">
                        <span class="label-input100">密码</span>
                        <input class="input100" type="password" name="upass" placeholder="请输入密码">
                        <span class="focus-input100"></span>
                    </div>



                    <div class="flex-sb-m w-full p-b-30">
                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">记住我</label>
                        </div>
                        <div>
                            <a href="/modifyPassword.jsp" class="txt1">忘记密码？</a>
                        </div>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn" >登 录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/main.js"></script>
<script >
    var code;
    function createCode() {
        code = "";
        var codeLength = 4; //验证码的长度
        var checkCode = document.getElementById("checkCode");
        var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
        for (var i = 0; i < codeLength; i++)
        {
            var charNum = Math.floor(Math.random() * 52);
            code += codeChars[charNum];
        }
        if (checkCode)
        {
            checkCode.className = "code";
            checkCode.innerHTML = code;
        }
    }
    function validateCode()
    {
        var inputCode = document.getElementById("inputCode").value;
        if (inputCode.length <= 0)
        {
            alert("请输入验证码！");
        }
        else if (inputCode.toUpperCase() != code.toUpperCase())
        {
            alert("验证码输入有误！");
            createCode();
        }
        else
        {
            document.getElementsByClassName("login100-form-btn")[0].click();
            alert("验证码正确！");
        }
    }
</script>
</body>

</html>