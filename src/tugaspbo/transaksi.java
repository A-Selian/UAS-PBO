/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tugaspbo;

import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import static tugaspbo.DBConnector.connection;

/**
 *
 * @author Acer
 */
public class transaksi {
    
    public int id_transaksi;
    public Float total_harga;
    public Float total_bayar;
    public int total_kembalian;
    
     public int generateRandomTransactionID(){
        Random rand = new Random();
        int randomNum = rand.nextInt(1000000);
        return randomNum;
    }
     

      public void insertDataTransaksi(){
        try{
            
            String sql = "INSERT INTO TRANSAKSI (id_transaksi,total_harga,total_bayar,total_kembalian) VALUES (?,?,?,?);";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id_transaksi);
            statement.setFloat(2, total_harga);
            statement.setFloat(3,total_bayar);
            statement.setFloat(4, total_kembalian);
            
            int rowInserted = statement.executeUpdate();
            if(rowInserted > 0){
                System.out.println("success adding new transaction");
            }
            
            statement.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
}
