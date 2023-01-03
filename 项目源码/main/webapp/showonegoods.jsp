<%@ page import="service.GoodsServiceImpl" %>
<%@ page import="service.GoodsService" %>
<%@ page import="bean.Goods" %>
<%@ page import="bean.User" %>
<%@ page import="utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>展示单个商品</title>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css"/>
    <link rel="stylesheet" type="text/css" href="css/showonegoods.css"/>
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
    <%
        String goodsId = request.getParameter("goodsId");
        GoodsService goodsService = new GoodsServiceImpl();
        Goods goods = goodsService.showOneGoods(goodsId);
    %>
    <div id="one_goods">
        <%--商品图片--%>
        <div id="image">
            <img src="<%="img/"+goods.getImage()%>" alt=""/>
        </div>
        <%--商品信息--%>
        <div id="goods_info">
            <%--商品名称--%>
            <div id="goods_name"><h3><%=goods.getName()%></h3></div>
            <%--商品简介--%>
            <div id="goods_introduction"><p><%=goods.getGoodsInfo()%></p></div>
            <%--商品价格--%>
            <div id="goods_price">价格：<span>¥<%=goods.getPrice()%></span></div>
            <%--商品库存--%>
            <div id="goods_count">库存：<span><%=goods.getCount()%></span></div>

                <form action="CartServlet?goodsId=<%=goods.getId()%>" method="post">
            <%--选择个数--%>
            <div id="select_number">
                数量：
                <%--选择框--%>
                <div class="countWrapper">
                    <%--减少--%>
                    <div class="quantityBtn minusBtn">
                        <span class="quantityBtnTextForPC"></span>
                    </div>
                    <%--展示数量--%>
                    <div class="countValueWrapper">
                        <input style="width: 50px;" class="countValueForPC" height="0" autocomplete="false" name="sum" value="1">
                    </div>
                    <%--减少--%>
                    <div class="quantityBtn addBtn">
                        <span class="quantityBtnTextForPC"></span>
                    </div>
                </div>
            </div>
            <%--加入购物车--%>
            <div id="goods_buy">
                    <button type="submit"><span>加入购物车</span></button>
            </div>
                </form>
        </div>
    </div>
</body>

</html>
