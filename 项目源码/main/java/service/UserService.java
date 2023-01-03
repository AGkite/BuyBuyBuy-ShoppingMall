package service;

import bean.User;

public interface UserService {
    //用户登录
    User login(String userId);
    //用户注册
    void register(String userName, String password, String phone);
    //判断用户是否存在
    boolean userExists(String userName);
}
