<jsp:include page="header.jsp" />
<body style="background: aliceblue">
    <div style="padding-left:850px;font-family:Arial; font-size: 20px">
<table style="table-layout:auto; text-align: center; vertical-align: middle;" border="1">
    <form action="AuthServlet" method="POST">
        <label style="color: brown; "> <%= request.getAttribute("status") != null ? "User Already Logged in " + request.getAttribute("status") : ""%></label>
        <tr> 
            <td>Username</td>
            <td><input type="text" name="usrn" /></td> 
        </tr>
        <tr>
            <td  colspan="2" style=" align-content: right;"><label style="color: red; font-weight: bold; ">  <%= request.getAttribute("error") != null ? "Invalid Credentials" : ""%></label></td> 
        </tr>
        <tr> 
            <td>Password </td>
            <td> <input type="password" name="pwd" />  </td> 
        </tr>
        <tr>
            <td colspan="2" style=" align-content: right;"><label style="color: red; font-weight: bold; ">  <%= request.getAttribute("error") != null ? "Invalid Credentials" : ""%></label></td> 
        </tr>
        <tr>  
            <td>  <input type="reset" value="Reset" /> </td> 
            <td> <input type="submit" name="action" value="Login" /> </td> 
        <tr>
    </form>
</table>
    </div>
</body>      
<jsp:include page="footer.jsp" />
