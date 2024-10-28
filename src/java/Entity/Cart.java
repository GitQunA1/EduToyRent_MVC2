/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author LENOVO
 */
public class Cart {
    private int UID;
    private int PID;
    private int Quantity;
    private float Total;
    private int RentTime;

    public Cart() {
    }

    public Cart(int UID, int PID, int Quantity, float Total, int RentTime) {
        this.UID = UID;
        this.PID = PID;
        this.Quantity = Quantity;
        this.Total = Total;
        this.RentTime = RentTime;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public int getRentTime() {
        return RentTime;
    }

    public void setRentTime(int RentTime) {
        this.RentTime = RentTime;
    }
    
}
