/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.bulletin.entity;

import java.sql.Timestamp;

/**
 *
 * @author davidchang
 */
public class DeviceData {

    String devDataText;
    String devID;
    String devType;
    Timestamp timestamp;

    public String getDevDataText() {
        return devDataText;
    }

    public void setDevDataText(String devDataText) {
        this.devDataText = devDataText;
    }

    public String getDevID() {
        return devID;
    }

    public void setDevID(String devID) {
        this.devID = devID;
    }

    public String getDevType() {
        return devType;
    }

    public void setDevType(String devType) {
        this.devType = devType;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
}
