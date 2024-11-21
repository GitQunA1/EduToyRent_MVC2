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
public class Product {
    private int pid;
    private int soid;
    private String image;
    private String name;
    private float price;
    private int qSell;
    private int qRent;
    private int age;
    private String brand;
    private String origin;
    private String description;
    private String category;
    private int type;
    private String status;

    public Product() {
    }

    public Product(int pid, int soid, String image, String name, float price, int qSell, int qRent, int age, String brand, String origin, String description, String category, int type, String status) {
        this.pid = pid;
        this.soid = soid;
        this.image = image;
        this.name = name;
        this.price = price;
        this.qSell = qSell;
        this.qRent = qRent;
        this.age = age;
        this.brand = brand;
        this.origin = origin;
        this.description = description;
        this.category = category;
        this.type = type;
        this.status = status;
    }

    

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSoid() {
        return soid;
    }

    public void setSoid(int soid) {
        this.soid = soid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getqSell() {
        return qSell;
    }

    public void setqSell(int qSell) {
        this.qSell = qSell;
    }

    public int getqRent() {
        return qRent;
    }

    public void setqRent(int qRent) {
        this.qRent = qRent;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    
}
