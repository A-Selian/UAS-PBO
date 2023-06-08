/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tugaspbo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Item {
    
    public String code;
    public String name;
    public Float price;
    
    static ArrayList<Item> daftarItem;
    
    public static void loadItemFromDB() {
    daftarItem = new ArrayList<Item>();
    Item item;
    try {
        Statement stmt = DBConnector.connection.createStatement();

        String sql = "SELECT * FROM item";

        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            item = new Item();
            item.code = Integer.toString(rs.getInt("code"));
            item.name = rs.getString("name");
            item.price = rs.getFloat("price");
            item.discount = rs.getFloat("discount");

            daftarItem.add(item);
        }
    } catch (Exception ex) {
        System.out.println(ex);
    }
}

    
    public static void main(String[] args) {
        DiscountedItem discountedItem = new DiscountedItem("Kode", "Nama", 100.0f, 0.2f);
        
        System.out.println("Code: " + discountedItem.code);
        System.out.println("Name: " + discountedItem.name);
        System.out.println("Price: " + discountedItem.price);
        
        System.out.println("Discount: " + discountedItem.getDiscount());
        System.out.println("Discounted Price: " + discountedItem.getDiscountedPrice());
    }
    private float discount;
}

class DiscountedItem extends Item {
    private float discount;

    public DiscountedItem(String code, String name, float price, float discount) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.discount = discount;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public float getDiscountedPrice() {
        float discountedPrice = price - (price * discount);
        return discountedPrice;
    }
}
