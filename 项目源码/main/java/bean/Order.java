package bean;

public class Order {
    private String name;
    private double price;
    private int sum;
    private String image;

    public Order() {
    }

    public Order(String name, double price, int sum, String image) {
        this.name = name;
        this.price = price;
        this.sum = sum;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Order{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", sum=" + sum +
                ", image='" + image + '\'' +
                '}';
    }
}
