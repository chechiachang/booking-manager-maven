/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.ntcbmcp.entity;

/**
 *
 * @author davidchang
 */
public class NtcEvent {

    private int id;
    private int roomId;
    private String unit;
    private String start;
    private String end;
    private String showtime;
    private String apply;
    private String pricing;
    private String phone1;
    private String phone2;
    private String title;
    private String servant;
    private String description;
    private String central;
    private String cleaner;
    private int staff;
    private String createdBy;
    private String modifiedBy;
    private String memo;
    private String resources;
    private int deleted;

    private String roomName;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getStaff() {
        return staff;
    }

    public void setStaff(int staff) {
        this.staff = staff;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getShowtime() {
        return showtime;
    }

    public void setShowtime(String showtime) {
        this.showtime = showtime;
    }

    public String getApply() {
        return apply;
    }

    public void setApply(String apply) {
        this.apply = apply;
    }

    public String getPricing() {
        return pricing;
    }

    public void setPricing(String pricing) {
        this.pricing = pricing;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getServant() {
        return servant;
    }

    public void setServant(String servant) {
        this.servant = servant;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCentral() {
        return central;
    }

    public void setCentral(String central) {
        this.central = central;
    }

    public String getCleaner() {
        return cleaner;
    }

    public void setCleaner(String cleaner) {
        this.cleaner = cleaner;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

}
