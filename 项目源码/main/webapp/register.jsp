
<%@ page import="utils.Constants" %>
<%@ page import="bean.User" %>
<%@ page import="service.UserServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册新用户</title>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css"/>
    <link rel="stylesheet" type="text/css" href="css/register.css"/>
</head>
<body background="img/Shopping.png">
<%--头部边框--%>
<div id="head">
    <div id="Logo"><img src="img/logo.png" alt=""></div>
    <div id="Super_link">
        <div id="head_Super_link">
            <div id="now_user">
                <%
                    User str_user = (User)request.getSession().getAttribute(Constants.USER_SESSION);
                    if(str_user==null){
                        out.println("用户未登录！");
                    }else{
                        out.println("当前用户："+str_user.getName());
                    }
                %>
            </div>
            <div class="a"><a href="index.jsp">网站首页</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="showByCategory.jsp">商品分类</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="login.jsp">登录</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="register.jsp">注册</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="order.jsp">我的订单</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="img"><img src="img/Shopping_cart.png" alt=""></div>
            <div class="a"><a href="CartServlet">购物车</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="LogoutServlet">退出登录</a></div>
        </div>
    </div>
</div>
    <%
        String msg = (String) request.getAttribute("msg");
        if(msg==null){msg = "";}
    %>
    <div id="register_window">
        <div id="reg_window">
            <p>注册新用户</p>
            <%--用户名已存在提示--%>
            <div id="msg"><%=msg%></div>
            <form id="register_from" action="RegisterServlet" method="post">
                <div class="reg_input">
                    <div class="reg_left">用&nbsp;户&nbsp;名:&nbsp;</div>
                    <div id="reg_name">
                        <input type="text" id="username" name="username" placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="reg_tip"></div>
                <br>
                <div class="reg_input">
                    <div class="reg_left">密&nbsp;&nbsp;&nbsp;码:&nbsp;</div>
                    <div id="reg_password1"><input type="password" id="password1" name="password1" placeholder="请输入登录密码"/> </div>
                </div>
                <div class="reg_tip"></div>
                <br>
                <div class="reg_input">
                    <div class="reg_left">确认密码:&nbsp;&nbsp;</div>
                    <div id="reg_password2"><input type="password" id="password2" name="password2" placeholder="请再次输入密码"/> </div>
                </div>
                <div class="reg_tip"></div>
                <br>
                <div class="reg_input">
                    <div class="reg_left">手机号码:&nbsp;&nbsp;</div>
                    <div id="reg_phone"><input type="text" id="phone" name="phone" placeholder="请输入手机号码"/></div>
                </div>
                <div class="reg_tip"></div>
                <br>
                <div class="reg_input">
                    <div class="reg_left">验&nbsp;证&nbsp;码:&nbsp;</div>
                    <div id="reg_code_"><input type="text" id="code" name="code" placeholder="请输入验证码"/> </div>
                    <div id="reg_code_img"><img src="VerificationCodeServlet?who=register" onclick="location.reload()" alt=""/></div>
                </div>
                <div class="reg_tip"></div>
                <br>
                <div id="submit_button">
                    <input onclick="return check()" type="submit" value="立即注册">
                </div>
            </form>
            <%--注册失败提示框--%>
            <script>
                function check() {
                    var password1 = document.getElementById("password1").value;
                    var password2 = document.getElementById("password2").value;
                    var phone = document.getElementById("phone").value;
                    var username = document.getElementById("username").value;
                    var code = document.getElementById("code").value;
                    if(password1 !== password2){
                        alert('注册失败！输入的两次密码不相同。');
                        //阻止表单提交
                        return false;
                    }else if(phone==null||phone===""){
                        alert('注册失败！手机号码不能为空。');
                        //阻止表单提交
                        return false;
                    }else if(username==null||username===""){
                        alert('注册失败！用户名不能为空。');
                        //阻止表单提交
                        return false;
                    }else if(code !== <%=request.getSession().getAttribute(Constants.Verification_Register_SESSION)%>){
                        alert('验证码不正确，请重新输入');
                        //阻止表单提交
                        return false;
                    }
                    //输入格式正确，执行表单提交后的逻辑
                    return true;
                }
            </script>
        </div>
    </div>
</body>
</html>
