/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.nhrservlet;

/**
 *
 * @author davidchang
 */
public class NhrData {
    private String macClusterId;
    private String shortMac;
    private String clusterId;
    private String data;
    private String position;

    public String getMacClusterId() {
        return macClusterId;
    }

    public void setMacClusterId(String macClusterId) {
        this.macClusterId = macClusterId;
    }

    
    public String getShortMac() {
        return shortMac;
    }

    public void setShortMac(String shortMac) {
        this.shortMac = shortMac;
    }

    public String getClusterId() {
        return clusterId;
    }

    public void setClusterId(String clusterId) {
        this.clusterId = clusterId;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    
    
}
