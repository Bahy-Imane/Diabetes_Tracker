<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>GlucoseLevel's List</title>
</head>
<body>
<h1>I wish that you are fine ${patient.firstName}</h1>
<h2>welcome to your account to properly monitor your diabetes </h2>
<h3><a href="/Diabetes_Tracker_war_exploded/new1/${patientId}">New GlucoseLevel</a></h3>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Date Time</th>
        <th>Glucose Level</th>
        <th>Patient</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listGlucoseLevel}" var="glucoseLevel">
        <tr>
            <td>${glucoseLevel.gId}</td>
            <td>${glucoseLevel.dateTime}</td>
            <td>${glucoseLevel.glucoseLevel}</td>
            <td>${glucoseLevel.patient.firstName} ${glucoseLevel.patient.lastName}</td>
            <td>
                <a href="/Diabetes_Tracker_war_exploded/deleteGlucose/${glucoseLevel.gId}/${glucoseLevel.patient.pId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
