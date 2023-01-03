package bean;

/*购物车类*/
public class CartItem {
    private  Goods goods;
    private  int  sum;

    public CartItem() {
    }
    public CartItem(Goods goods, int sum) {
        this.goods = goods;
        this.sum = sum;
    }
    public Goods getGoods() {
        return goods;
    }
    public void setGoods(Goods goods) {
        this.goods = goods;
    }
    public int getSum() {
        return sum;
    }
    public void setSum(int sum) {
        this.sum = sum;
    }
}