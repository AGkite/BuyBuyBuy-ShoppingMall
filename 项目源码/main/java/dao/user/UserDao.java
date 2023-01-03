package dao.user;

import bean.User;

import java.sql.Connection;

public interface UserDao {
    //得到要登录的用户
    User getLoginUser(Connection connection,String userName);
    //注册用户
    void registerUser(Connection connection, String userName, String password, String phone);
    //判断用户是否存在
    boolean userExists(String userName);
}
