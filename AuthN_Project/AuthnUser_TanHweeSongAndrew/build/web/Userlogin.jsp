<jsp:include page="hdr.jsp" />
<table style="float: right;  text-align: center; vertical-align: middle;" border="1">
    <form action="AuServlet" method="POST">
        <label style="color: brown; "> <%= request.getAttribute("status") != null ? "User Already Logged in " + request.getAttribute("status") : ""%></label>
        <tr> 
            <td>Enter Username</td>
            <td><input type="text" name="usrn" /></td> 
        </tr>
        <tr>
            <td  colspan="2" style=" align-content: right"><label style="color: red; font-weight: bold; ">  <%= request.getAttribute("error") != null ? "Invalid Credentials" : ""%></label></td> 
        </tr>
        <tr> 
            <td>Enter Password </td>
            <td> <input type="text" name="pwd" />  </td> 
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
       
<jsp:include page="ftr.jsp" />
