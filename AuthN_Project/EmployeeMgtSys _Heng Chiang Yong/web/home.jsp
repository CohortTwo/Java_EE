<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>


<jsp:include page="header.jsp" />

<%
    String usrName = session.getAttribute("user").toString();
    System.out.println(" From JSP :: " + usrName);

    if (usrName.equals("admin")) { %>
        
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT USERID, PASSWORD, USERNAME, INUSE FROM HR.AUTH_TBL ORDER BY USERID
        </sql:query>
        <table class='styled-table' border="2" width="100%" contenteditable="true" style="text-align: center;">
            <tr style=" font-weight: 800; background-color: lightblue">
                <th>User_ID</th>
                <th>Password</th>
                <th>User Name</th>
                <th>inUSE</th>
                <th>Operations</th>
            </tr>
            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td ><c:out value="${row.userid}" /></td>
                    <td id="pwd1"><c:out value="${row.password}"/></td>
                    <td id="usn1"><c:out value="${row.username}"/></td>
                    <td id="inu1"><c:out value="${row.inuse}"/></td>
                <form action="UserRegJSP.jsp" method="POST">

                    <input type="hidden" name="userid" value="${row.userid}">
                    <td><input type="submit" name="action" value="Delete">
                        <input type="submit" name='action' value='Edit' onclick="getData()">
                        <c:if test="${row.inuse == 1}">
                            <input type="submit" name="action" value="Unlock">
                        </c:if>  
                    </td>     
                </form>               
                    
                </tr>
            </c:forEach>
            <tr>
                <form action="UserRegJSP.jsp" method="POST">
                    <td><input type="text" name="usr"></td>
                    <td><input type="text" name="pwd"></td>
                    <td><input type="text" name="user"></td>
                    <td colspan="2"><input type="submit" name="action" value="Add"></td>
                </form>
            </tr>
        </table>
    </form>
    
    <% }
    else {
    %>
<div class='container content'>
    
    <div class='centered'>
        <table class='styled-table'>
            <tr>
                <a text-decoration:none href="MainMenu.jsp"><h3>Employees Management System</h3></a>
            </tr>
            <tr>,  </tr>
            <tr>,  </tr>
            <tr>,  </tr>
            <tr>,  </tr>
        </table>
    </div>
</div>
<% } %>
<form action="AuthServlet" method="POST">
    <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
    <br>   Click here to Logout &nbsp;&nbsp;&nbsp; <input type="submit" name="action" value="Logout" />
</form>
 
    <script>
        function getData()
        {
            var x = document.getElementById("pwd1").value;
            x = document.getElementById("pwd1").innerHTML="hello";
            console.log("the value of pwd1: "+x);
        }
    </script>
<jsp:include page="footer.jsp" />