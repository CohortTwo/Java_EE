<%-- 
    Document   : create
    Created on : Jan 26, 2021, 8:51:50 PM
    Author     : chand
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update User</title>
        <script>
            function updateUser() {
                var jsonString = JSON.stringify(Object.fromEntries(new FormData(document.forms.namedItem("uForm")).entries()));
                var id = document.getElementById("uForm").elements.namedItem("id").value;;
                console.log(jsonString);
                var XHR = new XMLHttpRequest();
                XHR.open("PUT", "http://localhost:7001/UserMgmt/resources/users/"+id);
                XHR.setRequestHeader('Content-Type', 'application/json');
                XHR.send(jsonString);
                
            }
        </script>
    </head>
    <body>
        <div style="padding-left:50px;font-family:monospace;">
            <h2>Create User</h2>
            <form id="uForm" onsubmit="updateUser()"  >
                <div style="width: 100px; text-align:left;">
                    <div style="padding:15px;">
                        User ID: <input name="id" />
                    </div>
                    <div style="padding:10px;">
                        Name: <input name="name" />
                    </div>
                    <div style="padding:10px;">
                        Email: <input name="email" />
                    </div>
                    <div style="padding:20px;text-align:center">
                        <input type="submit" value="Update User" />
                    </div>
                </div>
            </form>
            <BR> <p> <h3><a href="index.jsp"> Go to Home ...  </a> </h3> </p>
        </div>
    </body>
</html>