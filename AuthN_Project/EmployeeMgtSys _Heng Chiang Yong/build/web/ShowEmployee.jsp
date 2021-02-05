<%-- 
    Document   : ShowEmployee
    Created on : 1 Feb, 2021, 3:44:56 PM
    Author     : chiangyong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel='stylesheet' type='text/css' href='css/sm.css'>
        <title>Show Employee Details</title>
    </head>
    <body>
            <h1 class='header'>Employee Details</h1>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT * FROM HR.EMPLOYEES,DEPARTMENTS WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID ORDER BY EMPLOYEE_ID
        </sql:query>
            <section class='content' margin_left='150px'>
            <table class='styled-table' margin_left='150px'>
                <tr>
                    <th>EMP ID</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>SALARY</th>
                    <th>DEPARTMENT ID</th>
                    <th>MANAGER ID</th>     
                </tr>
                <c:forEach var='row' items="${rs.rows}">
                    <tr>
                        <td><c:out value="${row.employee_id}"/></td>
                        <td><c:out value="${row.first_name}"/></td>
                        <td><c:out value="${row.last_name}"/></td>  
                        <td><c:out value="${row.salary}"/></td>   
                        <td><c:out value="${row.department_name}"/></td>
                        <td><c:out value="${row.manager_id}"/></td>   
                    </tr>
                </c:forEach>
            </table>
            </section>
                    
          <div class='content'><a href="MainMenu.jsp">Go Main Menu</a></div>
         <footer class='footer'>Employees Management System Application</footer>
    </body>
</html>
