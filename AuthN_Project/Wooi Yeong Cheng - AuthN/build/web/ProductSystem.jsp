<%-- 
    Document   : ProductSystem
    Created on : Feb 1, 2021, 11:17:28 PM
    Author     : kentwooi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB Operations Page </title>
    </head>
    <body>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <c:set var="op" value='<%=request.getParameter("action")%>' />
        <c:if test="${op == 'Add'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                INSERT INTO HR.PRODUCT(PRODUCTID,PRODUCTNAME,PRODUCTPRICE) VALUES('<%=request.getParameter("pid")%>','<%=request.getParameter("pname")%>','<%=request.getParameter("price")%>')
            </sql:update>    
        </c:if>    

        <c:if test="${op == 'Delete'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                DELETE HR.PRODUCT WHERE PRODUCTID='<%=request.getParameter("userid")%>'
            </sql:update>    
        </c:if> 
                
             

        <%
            request.getRequestDispatcher("home.jsp").forward(request, response);
        %>
    </body>
</html>   
