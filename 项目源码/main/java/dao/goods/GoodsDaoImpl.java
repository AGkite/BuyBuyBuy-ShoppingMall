package dao.goods;

import bean.Goods;
import utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDaoImpl implements GoodsDao {
    /**
     * 显示所有商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> showAllGoods() {
        List<Goods> list = new ArrayList<>();
        try {
            Connection conn = DBUtil.getConn();
            PreparedStatement pstm = null;
            ResultSet rs = null;

            String sql = "select * from goods order by id desc;";
            rs = DBUtil.execute(conn,pstm,rs,sql);
            while(rs.next()){
                Goods goods = new Goods();
                goods.setId(rs.getInt("id"));
                goods.setName(rs.getString("name"));
                goods.setGoodsInfo(rs.getString("goods_info"));
                goods.setCategory(rs.getString("category"));
                goods.setPrice(rs.getDouble("price"));
                goods.setCount(rs.getInt("count"));
                goods.setHot(rs.getString("hot"));
                goods.setImage(rs.getString("image"));
                list.add(goods);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 显示一个商品
     *
     * @return {@link Goods}
     */
    @Override
    public Goods showOneGoods(String goodsId) {
        Goods goods = new Goods();
        try {
            Connection conn = DBUtil.getConn();
            PreparedStatement pstm = null;
            ResultSet rs = null;

            String sql = "select * from goods where id=?;";
            Object[] params = {goodsId};
            rs = DBUtil.execute(conn,pstm,rs,sql,params);
            if(rs.next()){
                goods.setId(rs.getInt("id"));
                goods.setName(rs.getString("name"));
                goods.setGoodsInfo(rs.getString("goods_info"));
                goods.setPrice(rs.getDouble("price"));
                goods.setCount(rs.getInt("count"));
                goods.setHot(rs.getString("hot"));
                goods.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }

    /**
     * 按类别显示
     *
     * @param category 类别
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> showByCategory(String category){
        List<Goods> list = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from goods where category=?";
            Object[] params = {category};
            rs = DBUtil.execute(conn,pstm,rs,sql,params);
            while(rs.next()){
                Goods goods = new Goods();
                goods.setId(rs.getInt("id"));
                goods.setName(rs.getString("name"));
                goods.setGoodsInfo(rs.getString("goods_info"));
                goods.setCategory(rs.getString("category"));
                goods.setPrice(rs.getDouble("price"));
                goods.setCount(rs.getInt("count"));
                goods.setHot(rs.getString("hot"));
                goods.setImage(rs.getString("image"));
                list.add(goods);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll(conn,pstm,rs);
        }
        return list;
    }
}
