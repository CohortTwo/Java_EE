<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <c:set var="op" value='<%=request.getParameter("action")%>' />

        <c:if test="${op == 'AddDept'}">

            <sql:update dataSource="${myDBAccess}" var="count">
                INSERT INTO HR.eeDepartments(Department_id,Department_name) VALUES((1+<%=request.getParameter("departmentId")%>),'<%=request.getParameter("departmentName")%>')
            </sql:update>    
        </c:if> 

        <c:if test="${op == 'DeleteDept'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                DELETE HR.eeDepartments WHERE Department_id=<%=request.getParameter("departmentId")%>
            </sql:update>    
        </c:if>     

        <c:if test="${op == 'UpdateDept'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                Update HR.eeDepartments SET Department_name='<%=request.getParameter("departmentName")%>' WHERE Department_id=<%=request.getParameter("departmentId")%>
            </sql:update>    
        </c:if>     

        <c:if test="${op == 'AddEmp'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                INSERT INTO HR.eeEmployees(Employee_id, First_name, Last_name, Salary, Department_id) VALUES((1+<%=request.getParameter("employeeId")%>),'<%=request.getParameter("firstName")%>','<%=request.getParameter("lastName")%>', <%=request.getParameter("salary")%>, <%=request.getParameter("departmentId")%> )
            </sql:update>    
        </c:if>       



        <c:if test="${op == 'DeleteEmp'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                DELETE HR.eeEmployees WHERE employee_id=<%=request.getParameter("employeeId")%>
            </sql:update>    
        </c:if>     

        <c:if test="${op == 'UpdateEmp'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                Update HR.eeEmployees SET first_name='<%=request.getParameter("firstName")%>', last_name='<%=request.getParameter("lastName")%>', salary=<%=request.getParameter("salary")%>,department_id='<%=request.getParameter("departmentId")%>' WHERE employee_id=<%=request.getParameter("employeeId")%>
            </sql:update>    
        </c:if>      


        <c:set var="sel" value='<%=request.getParameter("inpSelect")%>' />

        <%
            request.getRequestDispatcher("listing.jsp").forward(request, response);
        %>

                
</body>
</html>
