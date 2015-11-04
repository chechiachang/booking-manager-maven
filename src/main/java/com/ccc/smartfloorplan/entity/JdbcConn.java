/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.smartfloorplan.entity;

/**
 *
 * @author davidchang
 */
public class JdbcConn {
    static final String DB_URL = "jdbc:mysql://localhost:3306/smartfloorplan?useUnicode=yes&characterEncoding=UTF-8";
    static final String DRIVER_MANAGER = "com.mysql.jdbc.Driver";
    static final String USER = "kingsbeam";
    static final String PASS = "kingsbeam30985441";

    public JdbcConn() {
    }

    public static String getDB_URL() {
        return DB_URL;
    }

    public static String getDRIVER_MANAGER() {
        return DRIVER_MANAGER;
    }

    public static String getUSER() {
        return USER;
    }

    public static String getPASS() {
        return PASS;
    }
    
}
