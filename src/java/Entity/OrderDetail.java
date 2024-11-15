/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

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
    private String dateStart;
    private String dateEnd;
    private int status;

    public OrderDetail() {
    }

    public OrderDetail(int odid, int oid, int soid, int pid, int quantity, int rentTime, String dateStart, String dateEnd, int status) {
        this.odid = odid;
        this.oid = oid;
        this.soid = soid;
        this.pid = pid;
        this.quantity = quantity;
        this.rentTime = rentTime;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.status = status;
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

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }



    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    
    
}
