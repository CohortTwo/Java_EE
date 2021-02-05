<%-- 
    Document   : RegisterSystem
    Created on : Feb 2, 2021, 2:31:26 AM
    Author     : kentwooi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page </title>
    </head>
    <body>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <c:set var="op" value='<%=request.getParameter("action")%>' />
        <c:if test="${op == 'Register'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                INSERT INTO HR.AUTH_TBL(USERID,PASSWORD,USERNAME) VALUES('<%=request.getParameter("usr")%>','<%=request.getParameter("pwd")%>','<%=request.getParameter("user")%>')
            </sql:update>    
        </c:if>    
        
        

                <% 
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                %>
    </body>
</html>   