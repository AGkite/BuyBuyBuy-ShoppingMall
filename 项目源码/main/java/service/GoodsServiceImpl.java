package service;

import bean.Goods;
import dao.goods.GoodsDao;
import dao.goods.GoodsDaoImpl;
import org.testng.annotations.Test;

import java.util.Iterator;
import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    GoodsDao goodsDao = new GoodsDaoImpl();

    /**
     * 显示所有商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> showAllGoods() {
        return goodsDao.showAllGoods();
    }

    /**
     * 显示一个商品
     *
     * @param goodsId goodsId
     * @return {@link Goods}
     */
    @Override
    public Goods showOneGoods(String goodsId) {
        return goodsDao.showOneGoods(goodsId);
    }


    /**
     * 按类别显示
     *
     * @param category 类别
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> showByCategory(String category) {
        return goodsDao.showByCategory(category);
    }

    @Test
    public void test(){
        GoodsService goodsService = new GoodsServiceImpl();
        List<Goods> goodsList = goodsService.showByCategory("日用品");
        Iterator<Goods> iterator = goodsList.iterator();
        while(iterator.hasNext()){
            Goods goods = iterator.next();
            System.out.println(goods.getId()+" "+goods.getName()+" "+goods.getPrice()+" "+
                    goods.getCount()+" "+goods.getGoodsInfo()+" "+goods.getCategory()+" "+goods.getHot()+" "+goods.getImage());
        }
    }
}
