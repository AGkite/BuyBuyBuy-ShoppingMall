<%@ page import="bean.Goods" %>
<%@ page import="service.GoodsService" %>
<%@ page import="service.GoodsServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.User" %>
<%@ page import="utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类</title>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css"/>
    <link rel="stylesheet" type="text/css" href="css/showByCategory.css"/>
</head>
<body>
<%--头部边框--%>
<%
    User str_user = (User)request.getSession().getAttribute(Constants.USER_SESSION);
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
<%--展示所有商品--%>
<div id="commodity">
    <%
        GoodsService goodsService = new GoodsServiceImpl();
        String[] strings = {"食品","电子数码","书籍","日用品","服装"};
        for (String s : strings) {
        List<Goods> goodsList = goodsService.showByCategory(s);
        request.setAttribute("goodsList",goodsList);
        if(goodsList!=null){
    %>
    <div class="low">
        <p><%=s%></p>
        <%
            for(Goods goods:goodsList){
        %>
        <ul>
            <li class="img"><img src="<%="img/"+goods.getImage()%>" alt="" class="mobile_phone"/></li>
            <li class="name"><%=goods.getName()%></li>
            <li class="money">￥<%=goods.getPrice()%></li>
            <li class="affirm">
                <form action="showonegoods.jsp?goodsId=<%=goods.getId()%>" method="post">
                    <input type="submit" value="购买"/>
                </form>
            </li>
        </ul>
        <%
            }
        %>
        <hr style="background-color: blue;height: 3px;border: none;">
    </div>
    <%
        }
    %>
        <%
        }
    %>
</div>
</body>
</html>
