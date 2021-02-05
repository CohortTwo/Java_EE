<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <a href="home.jsp"> Return </a>
        </div>
        <%! int deptId;%>
        <%= request.getParameter("inpSelect")%>
        <c:set var="sel" value='<%=request.getParameter("inpSelect")%>' />
        <c:if test="${sel == '1'}">
            <h2>Department Listing :</h2>
            <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
            <sql:query dataSource="${myDBAccess}" var="rs">
                SELECT Department_id, Department_name FROM HR.eeDepartments Order By Department_id
            </sql:query>
            <table border="2" width="100%" contenteditable="true" style="text-align: center;">
                <tr style=" font-weight: 800; background-color: lightblue">
                    <th>Department ID</th>
                    <th>Department Name</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="row" items="${rs.rows}">
                    <tr>

                    <form action="updateList.jsp" method="POST">
                        <td>
                            <input type="text" disabled="true" value="${row.department_id}" >
                        </td>
                        <td>
                            <input type="text" name="departmentName" value="${row.department_name}" >
                        </td>

                        <input type="hidden" name="departmentId" value="${row.department_id}" />
                        <input type="hidden" name="inpSelect" value="1" />
                        <td>
                            <input type="submit" name="action" value="UpdateDept">
                        </td>
                    </form>

                    <form action="updateList.jsp" method="POST">
                        <input type="hidden" name="departmentId" value="${row.department_id}" />
                        <input type="hidden" name="inpSelect" value="1" />
                        <td><input type="submit" name="action" value="DeleteDept">

                        </td>
                    </form>
                </tr>
                <c:set var="deptSql" value="${row.department_id}" />
            </c:forEach>
            <tr>
                <fmt:parseNumber var="dept" type="number" value="${deptSql}" />  

            <form action="updateList.jsp" method="POST">
                <td><input type="text" disabled="true" value= '${deptSql+1}' ></td>
                <input type="hidden" name="departmentId" value='${deptSql}' />
                <td><input type="text" name="departmentName"></td>
                <input type="hidden" name="inpSelect" value="1" />
                <td><input type="submit" name="action" value="AddDept"></td>
            </form>
        </tr>
    </c:if>





    <c:if test="${sel == '2'}">
        <h2>Employee Listing :</h2>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT Employee_id, First_name, Last_name, Salary, Department_id FROM HR.eeEmployees
        </sql:query>
        <table border="2" width="100%" contenteditable="true" style="text-align: center;">
            <tr style=" font-weight: 800; background-color: lightblue">
                <th>Employee ID</th>
                <th>First Name</th>
                <th>Last Name ID</th>
                <th>Salary</th>
                <th>Department ID</th>
            </tr>
            <c:forEach var="row" items="${rs.rows}">
                <tr>

                <form action="updateList.jsp" method="POST">
                    <td>
                        <input type="text" disabled="true" value="${row.employee_id}" />
                    </td>
                    <td>
                        <input type="text" name="firstName" value="${row.first_name}" />
                    </td>
                    <td>
                        <input type="text" name="lastName" value="${row.last_name}" />
                    </td>
                    <td>
                        <input type="text" name="salary" value="${row.salary}" />
                    </td>
                    <td>
                        <input type="text" name="departmentId" value="${row.department_id}" />
                    </td>
                    <input type="hidden" name="employeeId" value="${row.employee_id}" />
                    <input type="hidden" name="inpSelect" value="2" />
                    <td><input type="submit" name="action" value="UpdateEmp"> </td>
                </form>

                <form action="updateList.jsp" method="POST">
                    <input type="hidden" name="employeeId" value="${row.employee_id}">
                    <input type="hidden" name="inpSelect" value="2" />
                    <td><input type="submit" name="action" value="DeleteEmp">
                </form>
                </tr>
                <c:set var="empSql" value="${row.employee_id}" />
            </c:forEach>
            <tr>
                <fmt:parseNumber var="emp" type="number" value="${empSql}" />

            <form action="updateList.jsp" method="POST">
                <td><input type="text" disabled="true" value= '${empSql + 1}' ></td>
                <input type="hidden" name="employeeId" value='${empSql}' />
                <td><input type="text" name="firstName"></td>
                <td><input type="text" name="lastName"></td>
                <td><input type="text" name="salary"></td>
                <td><input type="text" name="departmentId"></td>
                <input type="hidden" name="inpSelect" value="2" />
                <td><input type="submit" name="action" value="AddEmp"></td>
            </form>
            </tr>
        </c:if>


        </body>
        </html>
