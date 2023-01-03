package servlet;

import bean.CartItem;
import bean.Goods;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="RemoveGoodsServlet",value="/RemoveGoodsServlet")
public class RemoveGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String removeId = req.getParameter("removeId");
        HttpSession cartSession = req.getSession(false);
        List<CartItem> list = (List)cartSession.getAttribute(Constants.CART_SESSION);
        for(CartItem cartItem:list){
            if(String.valueOf(cartItem.getGoods().getId()).equals(removeId)){
                list.remove(cartItem);
                break;
            }
        }
        cartSession.setAttribute(Constants.CART_SESSION,list);
        resp.sendRedirect("cart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
