package dao.user;

import bean.User;
import utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    /**
     * 获取登录用户
     *
     * @param connection 连接
     * @param userName     用户id
     * @return {@link User}
     */
    @Override
    public User getLoginUser(Connection connection, String userName) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user = null;

        if(connection!=null){
            try {
                String sql = "select * from user where name=?";
                Object [] params = {userName};
                rs = DBUtil.execute(connection,pstm,rs,sql,params);
                if(rs.next()){
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setPassword(rs.getString("password"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                DBUtil.closeAll(connection,pstm,rs);
            }
        }
        return user;
    }

    //注册用户
    @Override
    public void registerUser(Connection connection, String userName, String password, String phone) {
        PreparedStatement pstm = null;
        int rows = 0;
        if(connection!=null){
            String sql = "insert into user(name,password,phone)values(?,?,?)";
            Object[] params = {userName,password,phone};
            rows = DBUtil.execute(connection,pstm,sql,params);
            DBUtil.closeAll(connection,pstm,null);
        }
    }

    //判断用户是否存在
    @Override
    public boolean userExists(String userName) {
        Connection connection = DBUtil.getConn();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select * from user where name=?";
        Object[] params = {userName};
        rs = DBUtil.execute(connection,pstm,rs,sql,params);
        try {
            if(rs.next()){//用户存在
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
