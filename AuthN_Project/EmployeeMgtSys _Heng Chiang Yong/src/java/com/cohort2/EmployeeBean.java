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
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;

/**
 *
 * @author chiangyong
 */
@Stateless
public class EmployeeBean {
    @Resource(name = "jdbc/oraDS")
    DataSource ds;
    Connection con;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    public void showAllEmployees() throws SQLException{
        Connection con = ds.getConnection();
        String qry = "select * from employees, departments where employees.department_id=departments.department_id order by employee_id";
        Statement st = con.createStatement();
        st.execute(qry);
        con.close();
    }
    
    public int MaxID() throws SQLException{
        int idMax=0;
        Connection con = ds.getConnection();
        String qry = "select max(employee_id) as maxid from employees";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(qry);
        rs.next();
        idMax = rs.getInt("employee_id");
        con.close();
        
        return idMax;
    }
}
