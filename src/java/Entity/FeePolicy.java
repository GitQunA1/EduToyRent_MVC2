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
public class FeePolicy {
    private int platform;
    private int week;
    private int biWeek;
    private int month;

    public FeePolicy() {
    }

    public FeePolicy(int platform, int week, int biWeek, int month) {
        this.platform = platform;
        this.week = week;
        this.biWeek = biWeek;
        this.month = month;
    }

    public int getPlatform() {
        return platform;
    }

    public void setPlatform(int platform) {
        this.platform = platform;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public int getBiWeek() {
        return biWeek;
    }

    public void setBiWeek(int biWeek) {
        this.biWeek = biWeek;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }
    
}
