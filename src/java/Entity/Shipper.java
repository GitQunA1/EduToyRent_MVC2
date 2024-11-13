/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author HagiLee
 */
public class Shipper {
    private int shid;
    private int uid;
    private String name;
    private String citizenCode;

    public Shipper() {
    }

    public Shipper(int shid, int uid, String name, String citizenCode) {
        this.shid = shid;
        this.uid = uid;
        this.name = name;
        this.citizenCode = citizenCode;
    }

    public int getShid() {
        return shid;
    }

    public void setShid(int shid) {
        this.shid = shid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCitizenCode() {
        return citizenCode;
    }

    public void setCitizenCode(String citizenCode) {
        this.citizenCode = citizenCode;
    }
    
    
}
