package dao.order;

import bean.Order;
import utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao{
    @Override
    public List<Order> showOrder(int user_id) {
        List<Order> list = new ArrayList<>();
        Connection connection = DBUtil.getConn();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select g.name,g.price,o.goods_num,g.image from goods g " +
                "inner join ordertable o " +
                "where g.id=o.goods_id and o.user_id=?";
        Object[] params = {user_id};
        rs = DBUtil.execute(connection,pstm,rs,sql,params);
        try {
            while(rs.next()){
                Order order = new Order();
                order.setName(rs.getString("g.name"));
                order.setPrice(rs.getDouble("g.price"));
                order.setSum(rs.getInt("o.goods_num"));
                order.setImage(rs.getString("g.image"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll(connection,pstm,rs);
        }
        return list;
    }

    @Override
    public void orderUpdate(int user_id,int goods_id,int goods_num) {
        Connection connection = DBUtil.getConn();
        PreparedStatement pstm = null;
        String sql = "insert into ordertable(user_id,goods_id,goods_num) values(?,?,?)";
        Object[] params = {user_id,goods_id,goods_num};
        DBUtil.execute(connection,pstm,sql,params);
        DBUtil.closeAll(connection,pstm,null);
    }
}
