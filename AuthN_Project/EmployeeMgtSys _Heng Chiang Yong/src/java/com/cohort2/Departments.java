/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cohort2;

import java.util.Objects;

/**
 *
 * @author chiangyong
 */
public class Departments {
    private int deptID;
    private String deptName;
    private int deptMgrID;
    private int deptLocID;

    public Departments() {
    }

    public Departments(int deptID, String deptName, int deptMgrID, int deptLocID) {
        this.deptID = deptID;
        this.deptName = deptName;
        this.deptMgrID = deptMgrID;
        this.deptLocID = deptLocID;
    }

    @Override
    public String toString() {
        return "Departments{" + "deptID=" + deptID + ", deptName=" + deptName + ", deptMgrID=" + deptMgrID + ", deptLocID=" + deptLocID + '}';
    }

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public int getDeptMgrID() {
        return deptMgrID;
    }

    public void setDeptMgrID(int deptMgrID) {
        this.deptMgrID = deptMgrID;
    }

    public int getDeptLocID() {
        return deptLocID;
    }

    public void setDeptLocID(int deptLocID) {
        this.deptLocID = deptLocID;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + this.deptID;
        hash = 41 * hash + Objects.hashCode(this.deptName);
        hash = 41 * hash + this.deptMgrID;
        hash = 41 * hash + this.deptLocID;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Departments other = (Departments) obj;
        if (this.deptID != other.deptID) {
            return false;
        }
        if (this.deptMgrID != other.deptMgrID) {
            return false;
        }
        if (this.deptLocID != other.deptLocID) {
            return false;
        }
        if (!Objects.equals(this.deptName, other.deptName)) {
            return false;
        }
        return true;
    }
    
    
}
