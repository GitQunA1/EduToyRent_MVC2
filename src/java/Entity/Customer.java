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
public class Customer {
    private int UID;
    private String Avatar;
    private String Name;
    private String Sex;
    private Date Birthday;
    private String Address;
    private String Membership;

    public Customer() {
    }

    public Customer(int UID, String Avatar, String Name, String Sex, Date Birthday, String Address, String Membership) {
        this.UID = UID;
        this.Avatar = Avatar;
        this.Name = Name;
        this.Sex = Sex;
        this.Birthday = Birthday;
        this.Address = Address;
        this.Membership = Membership;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String Avatar) {
        this.Avatar = Avatar;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date Birthday) {
        this.Birthday = Birthday;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMembership() {
        return Membership;
    }

    public void setMembership(String Membership) {
        this.Membership = Membership;
    }
    
}
