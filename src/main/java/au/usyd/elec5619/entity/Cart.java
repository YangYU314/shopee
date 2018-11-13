package au.usyd.elec5619.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;

    @Column(name = "item_id")
    private int item_id;

    @Column(name = "user_id")
    private int user_id;

    @Column(name = "qty")
    private int qty;

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", item_id=" + item_id +
                ", user_id=" + user_id +
                ", qty=" + qty +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
}
