package filter;

import bean.User;
import utils.Constants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class NotLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        User str_user = (User)req.getSession().getAttribute(Constants.USER_SESSION);
        if(str_user==null){
            //用户未登录，跳转到错误页面
            servletRequest.getRequestDispatcher("cart.jsp").forward(servletRequest,servletResponse);
        }else{
            //登录成功，放行
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
