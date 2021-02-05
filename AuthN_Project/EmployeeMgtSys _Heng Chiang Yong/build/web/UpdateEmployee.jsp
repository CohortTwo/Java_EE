<%-- 
    Document   : UpdateEmployee
    Created on : 1 Feb, 2021, 3:43:54 PM
    Author     : chiangyong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='css/sm.css'>
        <title>Update Employee Record </title>
        
    </head>
    <body>
     <h1 class="header">Update Employee Record</h1>
               
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT * FROM HR.EMPLOYEES,DEPARTMENTS WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID ORDER BY EMPLOYEE_ID
        </sql:query>
            <section class='content' margin_left='150px'>
            <table class='styled-table' margin_left='150px' border='1px' contenteditable="true">
                <tr>
                    <th>EMP ID</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>EMAIL</th>
                    <th>HIRE DATE</th>
                    <th>PHONE</th>
                    <th>JOB ID</th>
                    <th>SALARY</th>
                    <th>COMMISSION %</th>
                    <th>DEPARTMENT ID</th>
                    <th>DEPARTMENT NAME</th>
                    <th>MANAGER ID</th>     
                </tr>
                <c:forEach var='row' items="${rs.rows}">
                    <tr>
                        <td><c:out value="${row.employee_id}"/></td>
                        <td><c:out value="${row.first_name}"/></td>
                        <td><c:out value="${row.last_name}"/></td> 
                        <td><c:out value="${row.email}"/></td>
                        <td><fmt:formatDate pattern = "dd-MM-yyyy" value= "${row.hire_date}"/></td>
                        <td><c:out value="${row.phone_number}"/></td>  
                        <td><c:out value="${row.job_id}"/></td>
                        <td><c:out value="${row.salary}"/></td> 
                        <td><c:out value="${row.commission_pct}"/></td>
                        <td><c:out value="${row.department_name}"/></td>
                        <td><c:out value="${row.department_id}"/></td>
                        <td><c:out value="${row.manager_id}"/></td>   
                    </tr>
                </c:forEach>
            </table>
            </section>
         <div class='content'><a href="MainMenu.jsp">Go to Main Menu</a></div>
         <footer class='footer'>Employees Management System Application</footer>
        
    </body>
</html>
