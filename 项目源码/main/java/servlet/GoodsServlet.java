package servlet;

import bean.Goods;
import service.GoodsService;
import service.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="GoodsServlet",value="/GoodsServlet")
public class GoodsServlet extends HttpServlet {

    private GoodsService goodsService = new GoodsServiceImpl();

    //将所有商品信息转发到jsp页面
/*    public void showAllGoods(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        List<Goods> goodsList = goodsService.showAllGoods();
        req.setAttribute("goodsList",goodsList);
        req.getRequestDispatcher("showallgoods.jsp").forward(req,resp);
    }*/

    //根据商品id查找并展示商品
    public void showOneGoods(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        String goodsId = req.getParameter("goodsId");
        Goods goods = goodsService.showOneGoods(goodsId);
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("showonegoods.jsp").forward(req,resp);
    }
}
