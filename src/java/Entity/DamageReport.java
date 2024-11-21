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
public class DamageReport {
    private int odid;
    private String name;
    private int quantity;
    private String Overall;
    private String external;
    private String mobileParts;
    private String feature;
    private String accessory;
    private String image;
    private String description;
    private int noDamage;
    private int halfDamage;
    private int fullDamege;
    private String Date;
    

    public DamageReport() {
    }

    public DamageReport(int odid, String name, int quantity, String Overall, String external, String mobileParts, String feature, String accessory, String image, String description, int noDamage, int halfDamage, int fullDamege, String Date) {
        this.odid = odid;
        this.name = name;
        this.quantity = quantity;
        this.Overall = Overall;
        this.external = external;
        this.mobileParts = mobileParts;
        this.feature = feature;
        this.accessory = accessory;
        this.image = image;
        this.description = description;
        this.noDamage = noDamage;
        this.halfDamage = halfDamage;
        this.fullDamege = fullDamege;
        this.Date = Date;
    }

    public int getOdid() {
        return odid;
    }

    public void setOdid(int odid) {
        this.odid = odid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOverall() {
        return Overall;
    }

    public void setOverall(String Overall) {
        this.Overall = Overall;
    }

    public String getExternal() {
        return external;
    }

    public void setExternal(String external) {
        this.external = external;
    }

    public String getMobileParts() {
        return mobileParts;
    }

    public void setMobileParts(String mobileParts) {
        this.mobileParts = mobileParts;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getAccessory() {
        return accessory;
    }

    public void setAccessory(String accessory) {
        this.accessory = accessory;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNoDamage() {
        return noDamage;
    }

    public void setNoDamage(int noDamage) {
        this.noDamage = noDamage;
    }

    public int getHalfDamage() {
        return halfDamage;
    }

    public void setHalfDamage(int halfDamage) {
        this.halfDamage = halfDamage;
    }

    public int getFullDamege() {
        return fullDamege;
    }

    public void setFullDamege(int fullDamege) {
        this.fullDamege = fullDamege;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

   
    
}
