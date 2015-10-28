/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.entity;

/**
 *
 * @author davidchang
 */
public class JdbcConnBmcp {
    public static final String DB_URL = "jdbc:mysql://localhost:3306/bmcp?useUnicode=yes&characterEncoding=UTF-8";
    public static final String DRIVER_MANAGER = "com.mysql.jdbc.Driver";
    public static final String USER = "kingsbeam";
    public static final String PASS = "kingsbeam30985441";

    public JdbcConnBmcp() {
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
