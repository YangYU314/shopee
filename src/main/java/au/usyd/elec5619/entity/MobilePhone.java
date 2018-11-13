package au.usyd.elec5619.entity;


import javax.persistence.*;

@Entity
@Table(name = "mobile_phone")
public class MobilePhone {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;

    @Column(name = "brand")
    private String brand;

    @Column(name = "model")
    private String model;

    @Column(name = "capacity")
    private int capacity;

    @Column(name = "color")
    private String color;

    @Column(name = "price")
    private int price;

    @Column(name = "photo")
    private String photo;

    @Column(name = "abstracts")
    private String abstracts;

    @Column(name = "description")
    private String description;

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    @Column(name = "sales")
    private int sales;

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "MobilePhone{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", capacity=" + capacity +
                ", color='" + color + '\'' +
                ", price=" + price +
                ", photo='" + photo + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", description='" + description + '\'' +
                ", sales=" + sales +
                '}';
    }
}
