/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cohort2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;

/**
 *
 * @author chiangyong
 */
@Stateless
public class DepartmentsBean {
    @Resource(name = "jdbc/oraDS")
    DataSource ds;
    Connection con;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    public void showAllDepartments() throws SQLException{
        Connection con = ds.getConnection();
        String qry = "select * from departments order by department_id";
        Statement st = con.createStatement();
        st.execute(qry);
        con.close();
    }
    
    public List<Departments> list() throws SQLException{
        List<Departments> listDepartment = new ArrayList();
        Connection con = ds.getConnection();
        String qry = "select * from departments order by department_id";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(qry);
        
        while(rs.next()){
            int id = rs.getInt("department_id");
            String deptname = rs.getString("department_name");
            int deptmgr = rs.getInt("manager_id");
            int locid = rs.getInt("location_id");
            Departments department = new Departments(id,deptname,deptmgr,locid);
            listDepartment.add(department);
        }
        System.out.println(listDepartment);
        
        con.close();
        return listDepartment;
    }
}
