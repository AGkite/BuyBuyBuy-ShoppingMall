<%@ page import="utils.Constants" %>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css">
    <link rel="stylesheet" type="text/css" href="css/Login.css">
</head>
<body>
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
<%--页面主图,中部--%>
<div id="middle"><img src="img/购物狂欢节.jpg" alt=""></div>
<%--登录窗口--%>
<div id="Login_window">
    <div id="Login_window_tip"><font size="5">用户登录</font></div>
    <form id="login_form" action="LoginServlet" method="post">
        <div class="Login" id="username">
            <div class="Login_Icon"><img src="img/username.png" alt=""></div>
            <div class="Login_Input"><input type="text" name="login_username" id="Login_username" placeholder="用户名"></div>
        </div>
        <div class="Login_tip">
            <font size="2" color="red" id="tip_name"></font>
        </div>

        <div class="Login" id="password">
            <div class="Login_Icon"><img src="img/password.png" alt=""></div>
            <div class="Login_Input"><input type="password" name="login_password" id="Login_password" placeholder="密码"></div>
        </div>
        <div class="Login_tip">
            <font size="2" color="red" id="tip_psw"></font>
        </div>
<%--验证码--%>
        <div id="security_code">
            <font size="3">请输入验证码</font><font size="3" color="burlywood" style="cursor: pointer;" onclick="location.reload()">不清楚？换一张</font><br>
            <div id="Input_sec_code">
                <input type="text" name="captcha" id="captcha" placeholder="验证码">
            </div>
<%--            security_code--%>
            <div id="show_security_img">
                <img id="security_img" src="VerificationCodeServlet?who=login" onclick="location.reload()" alt="">
            </div>
            <div id="error_message"></div>
        </div>
        <div id="Login_action">
            <div id="message" class="error">
                <%
                    String str = (String)request.getAttribute("error");
                    if(str!=null){
                        out.println(str);
                    }
                %>
            </div>
            <div id="forget_password">
                <a href="#">忘记密码？</a>
            </div>
            <div id="Login_submit">
                <input id="submit-button" type="submit" value="登陆">
            </div>
            <div id="reg_now">
                <a href="register.jsp">立即注册</a>
            </div>
        </div>
    </form>
    <script>
        // 在表单提交时检查验证码是否正确
        let form = document.getElementById('login_form');
        form.onsubmit = function() {
            // 获取用户输入的验证码
            var userCode = form.elements['captcha'].value;
            // 判断用户输入的验证码是否与生成的验证码相同
            if (userCode !== <%=request.getSession().getAttribute(Constants.Verification_Login_SESSION)%>) {
                // 验证码不正确，给用户一个错误提示
                alert('验证码不正确，请重新输入');
                // 阻止表单提交
                return false;
            }
            // 验证码正确，执行表单提交后的逻辑
            return true;
        };
    </script>
</div>
</body>
</html>
