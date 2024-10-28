/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class OrderDetail {
    private int ODID;
    private int SOID;
    private int PID;
    private int Quantity;
    private int TimeRent;
    private Date DateStart;
    private Date DateEnd;
    private String Status;

    public OrderDetail() {
    }

    public OrderDetail(int ODID, int SOID, int PID, int Quantity, int TimeRent, Date DateStart, Date DateEnd, String Status) {
        this.ODID = ODID;
        this.SOID = SOID;
        this.PID = PID;
        this.Quantity = Quantity;
        this.TimeRent = TimeRent;
        this.DateStart = DateStart;
        this.DateEnd = DateEnd;
        this.Status = Status;
    }

    public int getODID() {
        return ODID;
    }

    public void setODID(int ODID) {
        this.ODID = ODID;
    }

    public int getSOID() {
        return SOID;
    }

    public void setSOID(int SOID) {
        this.SOID = SOID;
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

    public int getTimeRent() {
        return TimeRent;
    }

    public void setTimeRent(int TimeRent) {
        this.TimeRent = TimeRent;
    }

    public Date getDateStart() {
        return DateStart;
    }

    public void setDateStart(Date DateStart) {
        this.DateStart = DateStart;
    }

    public Date getDateEnd() {
        return DateEnd;
    }

    public void setDateEnd(Date DateEnd) {
        this.DateEnd = DateEnd;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
}
