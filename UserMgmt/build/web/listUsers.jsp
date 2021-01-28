<%-- 
    Document   : listUsers
    Created on : Jan 26, 2021, 11:25:20 PM
    Author     : chand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>User Mgmt List Users</title>
    <script>
        const xhr = new XMLHttpRequest();
        xhr.onload = () => {
            const userList = JSON.parse(xhr.responseText);
            dispData(userList);
        };
        xhr.open('GET', 'http://localhost:7001/UserMgmt/resources/users');
        xhr.send();
        var out = "";
        var i ;
        function dispData(userList) {
            out += " <table border=1> <tr> <th> ID </th> <th> Name  </th> <th> Email </th> </tr> ";
            for (i in userList) {
                out += "<tr> <td> " + userList[i].id + " </td> <td> " + userList[i].name + " </td> <td>" + userList[i].email + " </td>  </tr>  ";
            }
            document.getElementById("id01").innerHTML = out;
        }
    </script>
</head>
<body>
    <h1> Loading JSON using XHR</h1>
    <div id="id01"></div>
    <BR> <p> <a href="index.jsp"> Go to Home ...  </a> </p>
</body>
</html>

