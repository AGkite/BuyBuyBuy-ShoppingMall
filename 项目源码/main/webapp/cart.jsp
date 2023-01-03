<%@ page import="java.util.List" %>
<%@ page import="bean.CartItem" %>
<%@ page import="utils.Constants" %>
<%@ page import="bean.Goods" %>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="css/cart.css"/>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css"/>
</head>
<body>
<%--头部边框--%>
<%
    User str_user = (User)request.getSession().getAttribute(Constants.USER_SESSION);
    if(str_user==null){
        response.sendRedirect("LoginFail.jsp");
        return ;
    }
%>
<div id="head">
    <div id="Logo"><img src="img/logo.png" alt=""></div>
    <div id="Super_link">
        <div id="head_Super_link">
            <div id="now_user">
                <%
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
            <div class="a"><a href="cart.jsp">购物车</a></div>
            <div class="img"><img src="img/line.png" alt=""></div>
            <div class="a"><a href="LogoutServlet">退出登录</a></div>
        </div>
    </div>
</div>
    <h3><%=str_user.getName()%>的购物车</h3>
    <div id="main">
    <%
        List<CartItem> cart = null;
        boolean flag = true;
        HttpSession cartSession = request.getSession(false);
        if(session==null){
            flag = false;
        }else{
            cart = (List)cartSession.getAttribute(Constants.CART_SESSION);
            if(cart==null){flag = false;}
        }
        if(!flag){
            out.write(("对不起,您的购物车没有任何商品！<br>"));
        }else{
    %>
        <ul>
            <li>商品图片</li>
            <li>商品名称</li>
            <li>单价</li>
            <li>&nbsp;&nbsp;数量</li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;操作</li>
        </ul>
    <%
            for(CartItem cartGoods : cart){
    %>
    <div id="cart">
        <div id="image">
            <img src="<%="img/"+cartGoods.getGoods().getImage()%>" alt=""/>
        </div>
        <div id="goods_name">
            <span><%=cartGoods.getGoods().getName()%></span>
        </div>
        <div id="goods_price">
            <span><%=cartGoods.getGoods().getPrice()%></span>
        </div>
        <div id="goods_sum">
            <span><%=cartGoods.getSum()%></span>
        </div>
        <div id="del">
            <a href="RemoveGoodsServlet?removeId=<%=cartGoods.getGoods().getId()%>">移除</a>
        </div>
    </div>
    <%
            }
        }
    %>
    </div>
    <div id="push">
        <form action="OrderServlet" method="post">
            <input type="submit" value="结算"/>
        </form>
    </div>
</body>
</html>
