package servlet;

import bean.User;
import service.UserServiceImpl;
import utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="LoginServlet",value="/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error","");
        String userName = req.getParameter("login_username");
        String userPassword = req.getParameter("login_password");
        UserServiceImpl userService = new UserServiceImpl();
        User user = userService.login(userName);

        if(user!=null&&userPassword.equals(user.getPassword())){
            //清除未登录时操作的session数据
            req.getSession().removeAttribute(Constants.CART_SESSION);
            //清除登录验证码
            req.getSession().removeAttribute(Constants.Verification_Login_SESSION);
            //将用户信息放入Session中
            req.getSession().setAttribute(Constants.USER_SESSION,user);
            //跳转到主页
            resp.sendRedirect("index.jsp");
        }else{
            //登录失败，转发回登录页面
            req.setAttribute("error","用户名或密码错误！");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
