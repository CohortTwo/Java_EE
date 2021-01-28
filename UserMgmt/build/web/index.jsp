<%-- 
    Document   : index
    Created on : Jan 26, 2021, 8:51:10 PM
    Author     : chand
--%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>Create User</title>
    </head>
    <body>
        <div style="padding-left:50px;font-family:monospace;">
            <h1>CRUD Operations</h1></br></br> <h2>
            <a href="${pageContext.request.contextPath}/create.jsp"><div 
                    style="color:saffron">Create User</div></a></br></br>
            <a href="${pageContext.request.contextPath}/listUsers.jsp"><div 
                    style="color:saffron">Get User details</div></a></br></br>
            <a href="${pageContext.request.contextPath}/update.jsp"><div 
                    style="color:saffron">Update User</div></a></br></br>
            <a href="${pageContext.request.contextPath}/delete.jsp"><div 
                    style="color:saffron">Delete User</div></a></br></br> </h2>
        </div>
    </body>
</html>