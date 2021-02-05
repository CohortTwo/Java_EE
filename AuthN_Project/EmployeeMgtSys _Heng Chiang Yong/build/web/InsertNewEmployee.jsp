<%-- 
    Document   : InsertNewEmployee
    Created on : 1 Feb, 2021, 3:43:16 PM
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
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' type='text/css' href='css/sm.css'>
        <script>
            function insertStudent(){
               
            }
        </script>
        <title>New Employee Record</title>
    </head>
    <body>
        <h1 class="header">Create New Employee Record</h1>
         <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT MAX(EMPLOYEE_ID) AS MaxID FROM HR.EMPLOYEES
        </sql:query>
            
        <section class='content'>
            <div>New Employee Details</div>
        </section>
            <form action="EmpOperations.jsp" method="POST">
            <table class='styled-table' contenteditable="true">
            <tr class='content' style="padding: 10px;">
                 <c:forEach var='row' items="${rs.rows}">
                     
                <td>Employee ID: </td>
                <td style="margin-left:150px"><c:out value = "${row.MaxID+1}" /> 
                <input type='hidden' name='empID' value = "${row.MaxID+1}"></td>
                 </c:forEach>
            </tr>
            <tr class='content' style="padding:10px;">
                <td>First Name: </td> 
                <td><input style="margin-left:10px" name ="firstName" /></td>
            </tr>
            <tr class='content' style="padding:10px">
                <td>Last Name: </td> 
                <td><input name ="lastName" style="margin-left: 10px" /></td>
            </tr>
            <tr class='content' style="padding:10px;">
                <td>Email: </td> 
                <td><input name ="email" style="margin-left: 10px" /></td>
            </tr>
            <tr class = 'content' style="padding:10px">
                <td>Phone: </td>
                <td><input name ="phone" style="margin-left: 10px"/></td>
            </tr>
            <tr class='content' style="padding:10px;">
                <td>Hire Date: </td>
                <td><input name ="hiredate" style="margin-left: 10px"/></td>
            </tr>
             <tr class='content' style="padding:10px;">
                 <td>Job ID: </td>
                 <td><input name ="jobID" style="margin-left: 10px"/></td>
            </tr> 
            <tr class='content' style="padding:10px;">
                <td>Salary: </td>
                <td><input name ="salary" style="margin-left: 10px"/></td>
            </tr>
             <tr class='content' style="padding:10px;">
                 <td>Commission %: </td>
                 <td><input name ="commPCT" style="margin-left: 10px"/></td>
            </tr>
             <tr class='content' style="padding:10px;">
                 <td>Manager ID: </td>
                 <td><input name ="managerID" style="margin-left: 10px"/></td>
            </tr>
             <tr class='content' style="padding:10px;">
             <form action="/DepartmentListServlet" method="POST">
                 <td>Department ID: </td>
                 <td><select name ="deptID" style="margin-left: 10px">
                     <c:forEach items="${listDept}" var="dept">
                     <option value="${dept.deptID}"
                             <c:if test="${dept.deptID eq selectedDeptID}">selected="selected"</c:if>
                             >
                             ${dept.deptName} 
                     </option>
                     </c:forEach>
                    </select>
                 </td>
             </form>
            </tr>
            </table>
            
            <div class='content' >
                <input type ='submit' name='submit' value='create' style="margin-left: 250px;" />
            </div>
            </form>
        <div class='content'><a href="MainMenu.jsp">Go Main Menu</a></div>
         <footer class='footer'>Employees Management System Application</footer>
        
         
    </body>
</html>

