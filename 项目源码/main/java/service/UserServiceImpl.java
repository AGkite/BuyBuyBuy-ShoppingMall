package service;

import bean.User;
import dao.user.UserDao;
import dao.user.UserDaoImpl;
import org.testng.annotations.Test;
import utils.DBUtil;

import java.sql.Connection;

public class UserServiceImpl implements UserService {

    //业务层调用dao层
    private final UserDao userDao;
    public UserServiceImpl(){
        userDao = new UserDaoImpl();
    }
    //登录
    @Override
    public User login(String userName) {
        Connection connection = DBUtil.getConn();
        return userDao.getLoginUser(connection,userName);
    }
    //注册
    @Override
    public void register(String userName, String password, String phone) {
        Connection connection = DBUtil.getConn();
        userDao.registerUser(connection, userName, password, phone);
    }
    //判断用户是否存在
    @Override
    public boolean userExists(String userName) {
        return userDao.userExists(userName);
    }

    @Test
    public void test(){
        UserServiceImpl userService = new UserServiceImpl();
        User admin = userService.login("张三");
        System.out.println(admin.getPhone());
    }
}
