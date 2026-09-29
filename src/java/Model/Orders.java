package Model;

import java.util.Date;

public class Orders implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private String mobile;
    private String state;
    private String city;
    private String address;
    private Date orderDate;
    private String items;
    private int total;

    public Orders() {
    }

    public Orders(String name, String mobile, String state, String city, String address, Date orderDate, String items, int total) {
        this.name = name;
        this.mobile = mobile;
        this.state = state;
        this.city = city;
        this.address = address;
        this.orderDate = orderDate;
        this.items = items;
        this.total = total;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return this.mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return this.orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getItems() {
        return this.items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
