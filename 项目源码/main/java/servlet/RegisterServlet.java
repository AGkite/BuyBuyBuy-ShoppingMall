package servlet;

import service.UserServiceImpl;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="RegisterServlet",value="/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password1 = req.getParameter("password1");
        String phone = req.getParameter("phone");
        UserServiceImpl userService = new UserServiceImpl();
        //判断数据库中是否存在该用户
        if(!userService.userExists(username)){
            //将信息插入数据库
            userService.register(username,password1,phone);
            //清除注册验证码
            req.getSession().removeAttribute(Constants.Verification_Register_SESSION);
            //跳转到登录界面
            req.getRequestDispatcher("RegisterSuccess.jsp").forward(req,resp);
        }else{
            //注册失败！用户已存在。
            req.setAttribute("msg", "用户名已存在!");
            req.getRequestDispatcher("register.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
