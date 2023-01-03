package utils;

import java.sql.*;

public class DBUtil {//连接数据库
    public static Connection conn=null;
    public static final String DRIVER="com.mysql.cj.jdbc.Driver";
    public static final String RUL="jdbc:mysql://localhost:3306/shopping?serverTimezone=Asia/Shanghai&useSSL=true";
    public static final String DBUser="root";
    public static final String DBPassword="123456";

    //获取数据库连接
    public static Connection getConn() {
        try{
            Class.forName(DRIVER);
            conn= DriverManager.getConnection(RUL,DBUser,DBPassword);
        }catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 查询公共类
     *
     * @param connection        连接
     * @param preparedStatement 事先准备好声明中
     * @param resultSet         结果集
     * @param sql               sql
     * @param params            用于给sql传递参数
     * @return {@link ResultSet}
     */
    public static ResultSet execute(Connection connection,PreparedStatement preparedStatement,ResultSet resultSet,String sql,Object[] params){
        try {
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                //setObject,占位符从1开始，但数组从0开始,因此i+1
                preparedStatement.setObject(i+1,params[i]);
            }
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    /*完整的sql查询语句*/
    public static ResultSet execute(Connection connection,PreparedStatement preparedStatement,ResultSet resultSet,String sql){
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    //增删改公共方法
    public static int execute(Connection connection,PreparedStatement preparedStatement,String sql,Object[] params){
        int updateRows = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(i+1,params[i]);
            }
            updateRows = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updateRows;
    }

    //关闭数据库连接
    public static void closeAll(Connection conn, PreparedStatement pst, ResultSet rs) {
        if(rs != null) {
            try {
                rs.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(pst != null){
            try{
                pst.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}



