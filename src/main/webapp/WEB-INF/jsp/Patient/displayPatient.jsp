<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient's List</title>
</head>
<body>
<h2>Patient's List</h2>
<h3><a href="/Diabetes_Tracker_war_exploded/new">New Patient</a> </h3>
<table border="1">
    <tr>
        <th>Last Name</th>
        <th>First Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listPatient}" var="patient">
        <tr>
            <td>${patient.pId}</td>
            <td>${patient.firstName}</td>
            <td>${patient.lastName}</td>
            <td>${patient.email}</td>
            <td>${patient.phoneNumber}</td>
            <td>${patient.address}</td>
            <td>&nbsp;&nbsp;&nbsp;
                <a href="/Diabetes_Tracker_war_exploded/delete?id=${patient.pId}">Delete</a>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>