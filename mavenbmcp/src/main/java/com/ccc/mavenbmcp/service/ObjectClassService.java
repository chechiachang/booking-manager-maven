/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.service;

import com.ccc.mavenbmcp.biz.ObjectClassBiz;
import com.ccc.mavenbmcp.entity.ObjectClass;
import java.util.List;

/**
 *
 * @author davidchang
 */
public class ObjectClassService {

    private ObjectClass[] objectClasses;

    public ObjectClassService() {
        ObjectClassBiz objectClassBiz = new ObjectClassBiz();
        objectClasses = objectClassBiz.getObjectClasses();
    }

    public ObjectClass[] getObjectClasses() {
        return objectClasses;
    }

}
