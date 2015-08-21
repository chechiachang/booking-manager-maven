/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.mail;

import javax.faces.bean.ManagedBean;

/**
 *
 * @author davidchang
 */
@ManagedBean(name="welcomeEmail", eager=true)
public class WelcomeEmail {
    public WelcomeEmail(){
        System.out.println("welcomeEmail started!");
    }
    public String getMessage(){
        return "Welcome to Email System";
    }
}
