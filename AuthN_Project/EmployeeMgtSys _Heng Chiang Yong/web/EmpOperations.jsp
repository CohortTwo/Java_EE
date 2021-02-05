<%-- 
    Document   : EmpOperations
    Created on : 1 Feb, 2021, 2:44:37 PM
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
        <title>Employees Management System</title>
    </head>
    <body>
        <h1 class='header'>Employees Management System</h1>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <c:set var="ops" value='<%=request.getParameter("submit")%>'/>
            <c:if test="${ops=='create'}">
            <sql:update dataSource="${myDBAccess}" var="rs">
            INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) VALUES ('<%=request.getParameter("empID")%>','<%=request.getParameter("firstName")%>' ,'<%=request.getParameter("lastName")%>','<%=request.getParameter("email")%>','<%=request.getParameter("phone")%>','<%=request.getParameter("hiredate")%>' ,'<%=request.getParameter("jobID")%>' ,'<%=request.getParameter("salary")%>','<%=request.getParameter("commPCT")%>','<%=request.getParameter("managerID")%>' ,'<%=request.getParameter("deptID")%>')                                                                        
            </sql:update>  
            </c:if>
            <c:if test="${ops=='update'}">
              <sql:update dataSource="${myDBAccess}" var="rs">
                UPDATE HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) VALUES ('<%=request.getParameter("empID")%>','<%=request.getParameter("firstName")%>' ,'<%=request.getParameter("lastName")%>','<%=request.getParameter("email")%>','<%=request.getParameter("phone")%>','<%=request.getParameter("hiredate")%>' ,'<%=request.getParameter("jobID")%>' ,'<%=request.getParameter("salary")%>','<%=request.getParameter("commPCT")%>','<%=request.getParameter("managerID")%>' ,'<%=request.getParameter("deptID")%>')                                                                        
              </sql:update>    
            </c:if>  
            <c:if test="${ops=='delete'}">
                <sql:update dataSource="${myDBAccess}" var="rs">
                        DELETE HR.EMPLOYEES WHERE EMPLOYEE_ID='<%=request.getParameter("empID")%>'
                </sql:update>     
            </c:if>    
            
            <% 
                    request.getRequestDispatcher("InsertNewEmployee.jsp").forward(request, response);
                    request.getRequestDispatcher("DeleteEmployee.jsp").forward(request, response);
                    request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
            %>
          
    </body>
    
</html>
