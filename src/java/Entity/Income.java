/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class Income {

    private int soid;
    private int pid;
    private float incSell;
    private int qSell;
    private float incRent;
    private int qRent;
    private Date date;

    public Income() {
    }

    public Income(int soid, int pid, float incSell, int qSell, float incRent, int qRent, Date date) {
        this.soid = soid;
        this.pid = pid;
        this.incSell = incSell;
        this.qSell = qSell;
        this.incRent = incRent;
        this.qRent = qRent;
        this.date = date;
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

    public float getIncSell() {
        return incSell;
    }

    public void setIncSell(float incSell) {
        this.incSell = incSell;
    }

    public int getqSell() {
        return qSell;
    }

    public void setqSell(int qSell) {
        this.qSell = qSell;
    }

    public float getIncRent() {
        return incRent;
    }

    public void setIncRent(float incRent) {
        this.incRent = incRent;
    }

    public int getqRent() {
        return qRent;
    }

    public void setqRent(int qRent) {
        this.qRent = qRent;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
