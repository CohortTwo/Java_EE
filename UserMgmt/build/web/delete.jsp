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
            function deleteUser() {
                var id = document.getElementById("dForm").elements.namedItem("id").value;
                console.log(id);
                var XHR = new XMLHttpRequest();
                XHR.open("DELETE", "http://localhost:7001/UserMgmt/resources/users/" + id);
                XHR.send();
            }
        </script>
    </head>
    <body>
        <div style="padding-left:50px;font-family:monospace;">
            <h2>Create User</h2>
            <form id="dForm" onsubmit="deleteUser()" >
                <div style="width: 100px; text-align:left;">
                    <div style="padding:15px;">
                        User ID: <input name="id" />
                    </div>
                    <div style="padding:20px;text-align:center">
                        <input type="submit" value="Delete User" />
                    </div>
                </div>
            </form>

            <BR> <p> <h3><a href="index.jsp"> Go to Home ...  </a> </h3> </p>
        </div>
    </body>
</html>