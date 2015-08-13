/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.mail;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author davidchang
 */
@ManagedBean(name="helloWorld", eager=true)
@RequestScoped
public class HelloWorld {
    
    @ManagedProperty(value="#{message}")
    private Message messageBean;
    private String message;
    public HelloWorld(){
        System.out.println("HelloWorld started!");
    }
    public String getMessage(){
        if(messageBean != null){
            message = messageBean.getMessage();
        }
        return message;
    }
    public void setMessageBean(Message message){
        this.messageBean = message;
    }
}
