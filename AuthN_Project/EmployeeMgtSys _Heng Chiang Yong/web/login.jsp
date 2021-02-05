<jsp:include page="header.jsp" />
<table class='styled-table' style="float:right;  text-align: center; vertical-align: middle;" border="1">
    <form action="AuthServlet" method="POST">
        <label style="color: brown; "> <%= request.getAttribute("status") != null ? "User Already Logged in " + request.getAttribute("status") : ""%></label>
        <tr> 
            <td>Enter Username</td>
            <td><input id='usrn' type="text" name="usrn" /></td> 
        </tr>
        <tr>
            <td  colspan="2" style=" align-content: right"><label style="color: red; font-weight: bold; ">  <%= request.getAttribute("error") != null ? "Invalid Credentials" : ""%></label></td> 
        </tr>
        <tr> 
            <td>Enter Password </td>
            <td> <input id='pwd' type="text" name="pwd" />  </td> 
        </tr>
        <tr>
            <td colspan="2" style=" align-content: right;"><label style="color: red; font-weight: bold; ">  <%= request.getAttribute("error") != null ? "Invalid Credentials" : ""%></label></td> 
        </tr>
        <tr>  
            <td>  <input type="reset" name="clear" value="Reset" /> </td> 
            <td> <input type="submit" name="action" value="Login" /> </td> 
        <tr>
    </form>
</table>
        <section class='content'>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </section>
   <script>
  function clear(){
  		document.getElementById('usrn').value = ''
                document.getElementById('pwd').value = ''
  }
    </script>         
<jsp:include page="footer.jsp" />
