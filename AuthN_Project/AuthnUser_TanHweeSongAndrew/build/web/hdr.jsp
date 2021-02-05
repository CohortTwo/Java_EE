<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Login</title>
        <link href="style/newcss.css" rel="stylesheet" type="text/css"/>
    <table width="100%">
        <tr><td>
                <img src="image/abclogo.png" /> </td><td>
                <h1> User Database </h1>
            </td>
            <td>
                Welcome <%  if(session.getAttribute("user") == null)
                                out.println("Guest");  
                         else {
                               out.println(session.getAttribute("user").toString()); 
                        }%> 
            </td>
  
    </table>
</head>
<body>