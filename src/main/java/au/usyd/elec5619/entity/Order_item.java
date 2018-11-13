package au.usyd.elec5619.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "order_item")
public class Order_item implements Serializable {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;

    @Column(name = "item_id")
    private int item_id;

    @Column(name = "body_id")
    private int body_id;

    @Column(name = "qty")
    private int qty;

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

    public int getBody_id() {
        return body_id;
    }

    public void setBody_id(int body_id) {
        this.body_id = body_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
}
