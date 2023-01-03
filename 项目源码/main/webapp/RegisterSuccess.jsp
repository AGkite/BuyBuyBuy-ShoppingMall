
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
    <h2 style="text-align: center; color:green">注册成功!即将跳转到登录页面...</h2>
    <%response.setHeader("refresh", "2;URL=login.jsp");%>
</body>
</html>
