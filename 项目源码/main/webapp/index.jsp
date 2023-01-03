<%@ page import="utils.Constants" %>
<%@ page import="bean.User" %>
<%@ page import="bean.Goods" %>
<%@ page import="service.GoodsServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="service.GoodsService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<html>
    <head>
        <title>买买买购物网首页</title>
        <link rel="stylesheet" type="text/css" href="css/AllHead.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
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
<%--滚动文字条--%>
    <marquee direction="right" behavior="alternate"><span style="font-size:30px">📣</span><span id="mar">欢迎来到买买买购物网!</span></marquee>
<%--搜索栏--%>
    <div id="search">
        <form action="">
            <div id="input" ><input type="text" placeholder="食品/书本/电脑/手机" name="tip"></div>
            <div id="search-submit"><input type="submit" value="搜索"></div>
        </form>
    </div>
    <%--展示所有商品--%>
<div id="commodity">
    <%
        GoodsService goodsService = new GoodsServiceImpl();
        List<Goods> goodsList = goodsService.showAllGoods();
        request.setAttribute("goodsList",goodsList);
        if(goodsList!=null){
    %>
    <div class="low">
        <%
            for(Goods goods:goodsList){
        %>
        <ul>
            <li class="img"><img src="<%="img/"+goods.getImage()%>" alt="" class="mobile_phone"/></li>
            <li class="name"><%=goods.getName()%></li>
            <li class="money">￥<%=goods.getPrice()%></li>
            <%--onClick="window.open('showonegoods.jsp?goodsId=<%=goods.getId()%>)"--%>
            <li class="affirm">
                <form action="showonegoods.jsp?goodsId=<%=goods.getId()%>" method="post">
                    <input type="submit" value="购买"/>
                </form>
            </li>
        </ul>
        <%
            }
        %>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
