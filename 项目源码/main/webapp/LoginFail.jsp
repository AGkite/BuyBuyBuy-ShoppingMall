
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败</title>
</head>
<body>
    <h2 style="text-align: center; color:red">您还未登录账号！正在跳转到登录界面...</h2>
    <%response.setHeader("refresh", "2;URL=login.jsp");%>
</body>
</html>
