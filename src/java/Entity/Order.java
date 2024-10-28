/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class Order {
    private int OID;
    private int UID;
    private LocalDate CreationDate;
    private float Price;

    public Order() {
    }

    public Order(int OID, int UID, LocalDate CreationDate, float Price) {
        this.OID = OID;
        this.UID = UID;
        this.CreationDate = CreationDate;
        this.Price = Price;
    }

    public int getOID() {
        return OID;
    }

    public void setOID(int OID) {
        this.OID = OID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public LocalDate getCreationDate() {
        return CreationDate;
    }

    public void setCreationDate(LocalDate CreationDate) {
        this.CreationDate = CreationDate;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }
    
}
