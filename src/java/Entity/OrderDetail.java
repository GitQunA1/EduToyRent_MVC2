/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Quyền
 */
public class OrderDetail {
    private int odid;
    private int oid;
    private int soid;
    private int pid;
    private int quantity;
    private int rentTime;
    private Date dateStart;
    private Date dateEnd;
    private int Status;

    public OrderDetail() {
    }

    public OrderDetail(int odid, int oid, int soid, int pid, int quantity, int rentTime, Date dateStart, Date dateEnd, int Status) {
        this.odid = odid;
        this.oid = oid;
        this.soid = soid;
        this.pid = pid;
        this.quantity = quantity;
        this.rentTime = rentTime;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.Status = Status;
    }



    public int getOdid() {
        return odid;
    }

    public void setOdid(int odid) {
        this.odid = odid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getSoid() {
        return soid;
    }

    public void setSoid(int soid) {
        this.soid = soid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getRentTime() {
        return rentTime;
    }

    public void setRentTime(int rentTime) {
        this.rentTime = rentTime;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }


    
    
}
