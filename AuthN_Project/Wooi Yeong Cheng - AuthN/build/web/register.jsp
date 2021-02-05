<%-- 
    Document   : register
    Created on : Feb 1, 2021, 12:42:58 PM
    Author     : kentwooi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
    </head>
    <body>
        
        <h1>Welcome to Register Form!</h1>
                    <form action="RegisterSystem.jsp" method="POST">
			<table style="with: 50%">
				<tr>
					<td>User_ID</td>
					<td><input type="text" name="usr" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="pwd" /></td>
				</tr>
                                <tr>
                                        <td>User Name</td>
                                        <td><input type="text" name="user" /></td>
                                </tr>
				<tr>
                                     <td colspan="2"><a href="login.jsp">back to Home...</a> 
                                         <input type="submit" name="action" value="Register">
                                     </td>
                                </tr>        
                        </table> 
    
</form>
    </body>
</html>
