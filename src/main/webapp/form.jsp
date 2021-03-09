<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020-11-01
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>电话：<%= request.getParameter("phone")%></p>
    <p>邮箱：<%= request.getParameter("email")%></p>
</body>
</html>
