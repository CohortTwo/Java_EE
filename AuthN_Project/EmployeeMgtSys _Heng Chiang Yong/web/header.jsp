<!DOCTYPE html>

<html>
    <head><title>Login App</title>
        
       <link rel='stylesheet' type='text/css' href='css/sm.css'>
    <table width="100%">
        <tr><td>
                <img src="images/duke.png" /> </td><td>
                <h1 class='header'> Welcome to User Login Management App </h1>
            </td>
        </tr>
        <tr>
            <td class="text1">
                Welcome <%  if(session.getAttribute("user") == null)
                                out.println("Guest");  
                         else {
                               out.println(session.getAttribute("user").toString()); 
                        }%> 
            </td>
        </tr>
    </table>
</head>
<body>