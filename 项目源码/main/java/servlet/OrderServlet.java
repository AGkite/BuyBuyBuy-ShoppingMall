package servlet;

import bean.CartItem;
import bean.User;
import service.OrderService;
import service.OrderServiceImpl;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="OrderServlet",value="/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderServiceImpl();
        User user = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        if(user==null){
            resp.sendRedirect("LoginFail.jsp");
            return ;
        }
        List<CartItem> list = (List<CartItem>)req.getSession().getAttribute(Constants.CART_SESSION);
        if(list==null){
            resp.sendRedirect("order.jsp");
            return ;
        }
        int user_id = user.getId();
        for(CartItem cart:list){
            int goods_id = cart.getGoods().getId();
            int goods_num = cart.getSum();
            orderService.orderUpdate(user_id,goods_id,goods_num);
        }
        //购买后清除购物车的数据
        req.getSession().removeAttribute(Constants.CART_SESSION);
        resp.sendRedirect("order.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
