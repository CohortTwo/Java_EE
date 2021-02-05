<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<jsp:include page="hdr.jsp" />

<%
    String usrName = session.getAttribute("user").toString();
    System.out.println(" From JSP :: " + usrName);
//change Adminstrator to Admin
    if (usrName.equals("admin")) { %>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT USERID, PASSWORD, USERNAME, INUSE FROM HR.AUTH_TBL ORDER BY USERID
        </sql:query>
        <table border="2" width="100%" contenteditable="true" style="text-align: center;">
            <tr style=" font-weight: 800; background-color: lightblue">
                <th>User_ID</th>
                <th>Password</th>
                <th>User Name</th>
                <th>inUSE</th>
                <th>Operations</th>
            </tr>
            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td><c:out value="${row.userid}"/></td>
                    <td><c:out value='${row.password}'/></td>
                    <td><c:out value='${row.username}'/></td>
                    <td><c:out value='${row.inuse}'/></td>
                <form action="adminpage.jsp" method="POST">
                    <td>
                        <input type="hidden" name="userid" value="${row.userid}">
                        
                        <c:if test="${row.inuse == 1}">
                            <input type="submit" name="action" value="Unlock">
                        </c:if>
                        <c:if test="${row.username.trim() != 'admin'}">
                            <input type="submit" name="action" value="Delete">
                        </c:if>            
                </form>
            </td>
            </tr>
    </c:forEach>
            
     <%--
        <sql:query dataSource="jdbc/oraDS" var="auto">
            SELECT (MAX(USERID)+1) as MAXID FROM HR.AUTH_TBL
        </sql:query>   
     <td><input type="text" name="usr" value="${row.MAXID}" readonly="true" onfocus="blur()"></td>
     --%>
    <form action="adminpage.jsp" method="POST">
        <tr>
            <td><input type="text" name="usr"></td>
        <td><input type="text" name="pwd"></td>
        <td><input type="text" name="user"></td>
        <td colspan="2"><input type="submit" name="action" value="Add"></td>
        </tr>
        <tr>
        <td><input type="text" name="usrid"></td>
        <td><input type="text" name="pword"></td>
        <td><input type="text" name="usrnam"></td>
        <td colspan="2"><input type="submit" name="action" value="Edit"> </td>
        </tr>
    </form>
</table>
<% }
else {
%>
<img src="image/Home.jpg" alt="Home Page for Non-Admin Users"/>

<% } %>
<form action="AuServlet" method="POST">
    <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
    <br>   Click here to Logout &nbsp;&nbsp;&nbsp; <input type="submit" name="action" value="Logout" />
</form>

<jsp:include page="ftr.jsp" />