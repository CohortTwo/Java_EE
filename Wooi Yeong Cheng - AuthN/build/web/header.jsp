<!DOCTYPE html>

<html>
    <head><title>Login App</title>
        
        <link href="css/one.css" rel="stylesheet" type="text/css" />
    <table width="100%" >
        <tr>
            <td>
                <img src="images/cartoon (2).png" alt=""/>
            </td>
            <td>
                <h1> Welcome to My Application </h1>
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