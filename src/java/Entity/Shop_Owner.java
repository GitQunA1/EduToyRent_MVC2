/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author LENOVO
 */
public class Shop_Owner {
    private int uid;
    private int soid;
    private String avatar;
    private String name;
    private String citizenCode;
    private String wareHouse;
    private int type;

    public Shop_Owner() {
    }

    public Shop_Owner(int uid, int soid, String avatar, String name, String citizenCode, String wareHouse, int type) {
        this.uid = uid;
        this.soid = soid;
        this.avatar = avatar;
        this.name = name;
        this.citizenCode = citizenCode;
        this.wareHouse = wareHouse;
        this.type = type;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSoid() {
        return soid;
    }

    public void setSoid(int soid) {
        this.soid = soid;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getWareHouse() {
        return wareHouse;
    }

    public void setWareHouse(String wareHouse) {
        this.wareHouse = wareHouse;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
}
