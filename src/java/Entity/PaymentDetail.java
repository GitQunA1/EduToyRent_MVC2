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
public class PaymentDetail {
    private int pdid;
    private int paid;
    private int odid;
    private float price;
    private float points;
    private float deposit;
    private float refundShop;
    private float refundCus;
    private float platformFee;
    private String date;
    private String status;

    public PaymentDetail() {
    }

    public PaymentDetail(int pdid, int paid, int odid, float price, float points, float deposit, float refundShop, float refundCus, float platformFee, String date, String status) {
        this.pdid = pdid;
        this.paid = paid;
        this.odid = odid;
        this.price = price;
        this.points = points;
        this.deposit = deposit;
        this.refundShop = refundShop;
        this.refundCus = refundCus;
        this.platformFee = platformFee;
        this.date = date;
        this.status = status;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public int getPaid() {
        return paid;
    }

    public void setPaid(int paid) {
        this.paid = paid;
    }

    public int getOdid() {
        return odid;
    }

    public void setOdid(int odid) {
        this.odid = odid;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getPoints() {
        return points;
    }

    public void setPoints(float points) {
        this.points = points;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public float getRefundShop() {
        return refundShop;
    }

    public void setRefundShop(float refundShop) {
        this.refundShop = refundShop;
    }

    public float getRefundCus() {
        return refundCus;
    }

    public void setRefundCus(float refundCus) {
        this.refundCus = refundCus;
    }

    public float getPlatformFee() {
        return platformFee;
    }

    public void setPlatformFee(float platformFee) {
        this.platformFee = platformFee;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
