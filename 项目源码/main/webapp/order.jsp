<%@ page import="dao.order.OrderDao" %>
<%@ page import="dao.order.OrderDaoImpl" %>
<%@ page import="utils.Constants" %>
<%@ page import="bean.User" %>
<%@ page import="service.OrderService" %>
<%@ page import="service.OrderServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单</title>
    <link rel="stylesheet" type="text/css" href="css/AllHead.css"/>
    <link rel="stylesheet" type="text/css" href="css/order.css"/>
</head>
<body>
<%
    HttpSession session2 = request.getSession();
    User user = (User)session2.getAttribute(Constants.USER_SESSION);
    if(user==null){
        response.sendRedirect("LoginFail.jsp");
        return ;
    }
    int user_id = user.getId();
    OrderService orderService = new OrderServiceImpl();
    List<Order> list = orderService.showOrder(user_id);
%>
<div id="head">
    <div id="Logo"><img src="img/logo.png" alt=""></div>
    <div id="Super_link">
        <div id="head_Super_link">
            <div id="now_user">
                <%
                    if(user==null){
                        out.println("用户未登录！");
                    }else{
                        out.println("当前用户："+user.getName());
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
    <table border="1" cellspacing="0">
        <caption>我的订单</caption>
        <tr>
            <th>商品图片</th>
            <th>商品名称</th>
            <th>商品总价</th>
            <th>商品数量</th>
        </tr>
        <%
            for(Order order:list){
        %>
        <tr>
            <td  class = "td"><img src="<%="img/"+order.getImage()%>" alt=""/></td>
            <td  class = "td"><%=order.getName()%></td>
            <td  class = "td"><%=order.getPrice()*order.getSum()%></td>
            <td  class = "td"><%=order.getSum()%></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
