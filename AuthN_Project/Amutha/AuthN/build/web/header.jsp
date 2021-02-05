<!DOCTYPE html>

<html>
    <head><title>Login App</title></head>
    <body>      
        <link href="css/one.css" rel="stylesheet" type="text/css"/>
                   
             <h1 style="padding-left:800px"> Hi! 
                        <%  if(session.getAttribute("user") == null)
                                out.println("Guest");  
                         else {
                               out.println(session.getAttribute("user").toString()); 
                        }%> 
           , Welcome to Authentication </h1>
 
    </body>

</html>