<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
</head>
<body>
<div>
<h2>Add Patient</h2>
<form action="addPatientAction" method="post" modelAttribute="patient" >
    <table >
    <tr>
    <td>Last Name : </td>
    <td><input type="text" name="firstName"><br></td>
    </tr>

    <tr>
    <td> First Name :</td>
    <td><input type="text" name="lastName"><br></td>
    </tr>

    <td>Email : </td>
    <td><input type="text" name="email"><br></td>

    <tr>
    <td>Phone Number : </td>
    <td><input type="text" name="phoneNumber"><br></td>
    </tr>

    <tr>
    <td>Address :</td>
    <td><input type="text" name="address"><br></td>
    </tr>

    <tr>
    <td><input type="submit" value="Add"></td>
    </tr>
    </table>
</form>
</div>
</body>
</html>

