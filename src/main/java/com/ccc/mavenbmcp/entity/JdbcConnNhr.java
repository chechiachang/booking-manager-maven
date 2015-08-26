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
public class JdbcConnNhr {
    static final String DB_URL = "jdbc:mysql://localhost:3306/nhr?useUnicode=yes&characterEncoding=UTF-8";
    static final String DRIVER_MANAGER = "com.mysql.jdbc.Driver";
    static final String USER = "nhr";
    static final String PASS = "25ac7375c1fd64eca8dd8cf309071c0d";

    public JdbcConnNhr() {
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
