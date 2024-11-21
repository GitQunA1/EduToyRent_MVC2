/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;



/**
 *
 * @author ACER
 */
public class Customer {
    private  int uid;
    private  String avatar;
    private  String name;
    private  String sex;
    private  Date birthday;
    private  String address;
    private  int membership;

    public Customer() {
    }

    public Customer(int uid, String avatar, String name, String sex, Date birthday, String address, int membership) {
        this.uid = uid;
        this.avatar = avatar;
        this.name = name;
        this.sex = sex;
        this.birthday = birthday;
        this.address = address;
        this.membership = membership;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getMembership() {
        return membership;
    }

    public void setMembership(int membership) {
        this.membership = membership;
    }

    
}
