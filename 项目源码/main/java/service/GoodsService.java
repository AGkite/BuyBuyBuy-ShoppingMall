package service;

import bean.Goods;

import java.util.List;

public interface GoodsService {
    //展示所有商品
    List<Goods> showAllGoods();
    //展示单个商品
    Goods showOneGoods(String goodsId);
    //根据商品分类展示商品
    List<Goods> showByCategory(String category);

}
