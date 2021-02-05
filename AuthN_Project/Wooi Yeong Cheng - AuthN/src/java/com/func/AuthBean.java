/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.func;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;

/**
 *
 * @author chand
 */
@Stateless
public class AuthBean {

    @Resource(name = "jdbc/oraDS")
    DataSource ds;
    Connection con;
    
    public boolean checkIfLoggedIn(String userid) throws SQLException {
        Connection con = ds.getConnection();
        String stmt = "SELECT INUSE from HR.AUTH_TBL where USERID='" + userid + "'";
//        System.out.println(" CheckIf Logged In :: " + stmt);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(stmt);
        if (rs.next()) {
            if (rs.getInt(1) == 1) {
                System.out.println(" User already logged in.. so exiting :: " + rs.getInt(1));
                con.close();
                return true;
            }
        }
        con.close();
        return false;
    }

    public void setLoggedInStatus(String userid) throws SQLException {
        Connection con = ds.getConnection();
        String stmt = "update HR.AUTH_TBL SET INUSE=1 where USERID='" + userid + "'";
        Statement st = con.createStatement();
        st.executeUpdate(stmt);
        con.close();
    }

    public void setLoggedOutStatus(String userid) throws SQLException {
        Connection con = ds.getConnection();
        String stmt = "update HR.AUTH_TBL SET INUSE=0 where USERNAME='" + userid + "'";
//        System.out.println(" Logout Stmt " + stmt);
        Statement st = con.createStatement();
        st.executeUpdate(stmt);
        con.close();
    }

    public String loginNow(String userid, String pwd) throws SQLException {
        Connection con = ds.getConnection();
        String stmt = "select USERNAME from HR.AUTH_TBL where USERID='" + userid + "' and PASSWORD='" + pwd + "' ";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(stmt);
    //    System.out.println(stmt + " STMT Executed here    " + userid + "   ::  " + pwd);
        if (rs.next()) {
            String usr = rs.getString(1);
            System.out.println(" Username = " + usr);
            con.close();
            return usr.trim();
        } else {
            con.close();
            System.out.println(" Invalid Credentials ");
            return "invalid";
        }
    }
}
