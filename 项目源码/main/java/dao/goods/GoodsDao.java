package dao.goods;

import bean.Goods;

import java.util.List;

public interface GoodsDao {
    List<Goods> showAllGoods();
    Goods showOneGoods(String goodsId);
    List<Goods> showByCategory(String category);
}
