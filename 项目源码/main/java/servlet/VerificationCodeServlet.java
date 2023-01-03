package servlet;

import utils.Constants;
import utils.VerificationCodeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="VerificationCodeServlet",value="/VerificationCodeServlet")
public class VerificationCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String who = req.getParameter("who");
        try{
            if(who.equals("login")){
                //得到验证码并且将验证码图片写入到response对象中
                String code = VerificationCodeUtil.generateVerificationCode(200,50,5,resp.getOutputStream(),"png");
                //设置验证码到session
                req.getSession().setAttribute(Constants.Verification_Login_SESSION,code);
            }else if(who.equals("register")){
                //得到验证码并且将验证码图片写入到response对象中
                String code = VerificationCodeUtil.generateVerificationCode(150,40,5,resp.getOutputStream(),"png");
                //设置验证码到session
                req.getSession().setAttribute(Constants.Verification_Register_SESSION,code);
            }
        }catch(IOException e){
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
