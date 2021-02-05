<%-- 
    Document   : MainMenu
    Created on : 2 Feb, 2021, 12:44:22 AM
    Author     : chiangyong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel='stylesheet' type='text/css' href='css/sm.css'>
        <title>Main Page</title>
    </head>
    <body>
         <h1 class='header'>Employees Management System</h1>
         <section class="content container">
             <table class="styled-table">
                 <tr>
                     <td>
                         <nav><a href="${pageContext.request.contextPath}/InsertNewEmployee.jsp">Create New Employee Record</a></nav>                     
                     </td>
                 </tr>
                <tr>
                    <td>
                        <nav><a href="${pageContext.request.contextPath}/ShowEmployee.jsp">Show Employees Details</a></nav>
                    </td>
                </tr>
                <tr>
                    <td>
                        <nav><a href="${pageContext.request.contextPath}/UpdateEmployee.jsp">Update Employee Record</a></nav>
                    </td>
                </tr>
                <tr>
                    <td>
                        <nav><a href="${pageContext.request.contextPath}/DeleteEmployee.jsp">Delete Employee Record</a></nav>
                    </td>
                </tr>
            </table>
         </section>
        <div class='content'><a href="home.jsp">Back to Home</a></div>
        <footer class='footer'>Employees Management Application  Copyright@2021</footer>
    </body>
</html>
