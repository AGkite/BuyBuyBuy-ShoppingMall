package servlet;

import bean.CartItem;
import bean.Goods;
import bean.User;
import service.GoodsService;
import service.GoodsServiceImpl;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="CartServlet",value="/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String goodsId = req.getParameter("goodsId");
        if(goodsId==null){
            resp.sendRedirect("cart.jsp");
            return;
        }
        //判断用户是否登录
        User str_user = (User)req.getSession().getAttribute(Constants.USER_SESSION);
        if(str_user==null){
            resp.sendRedirect("LoginFail.jsp");
            return ;
        }
        GoodsService goodsService = new GoodsServiceImpl();
        Goods goods = goodsService.showOneGoods(goodsId);
        int sum = Integer.parseInt(req.getParameter("sum"));
        //记录商品和数量
        CartItem cartItem = new CartItem(goods,sum);
        //通过request获取session
        HttpSession session = req.getSession();
        List<CartItem> cartList = (List)session.getAttribute(Constants.CART_SESSION);
        if(cartList==null){
            cartList = new ArrayList<CartItem>();
            //通过session设置Cart的值
            session.setAttribute(Constants.CART_SESSION,cartList);
        }
        //判断购物车是否已经存在该商品了，存在：商品数量加
        boolean flag = true;
        for (CartItem cart:cartList) {
            if(cart.getGoods().getId()==cartItem.getGoods().getId()){
                cartList.remove(cart);
                cart.setSum(cart.getSum()+sum);
                cartList.add(cart);
                flag = false;
                break;
            }
        }
        if(flag){
            cartList.add(cartItem);
        }
        resp.sendRedirect("cart.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
