<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Glucose Level</title>
</head>
<body>
<h2>Add New Glucose Level</h2>
<form action="/Diabetes_Tracker_war_exploded/addGlucoseLevel" method="post">
    <table>
        <tr>
            <td>Date and Time:</td>
            <td><input type="datetime-local" name="dateTime" required/></td>
        </tr>
        <tr>
            <td>Glucose Level:</td>
            <td><input type="text" step="0.01" name="glucoseLevel" required/></td>
        </tr>
        <tr>
            <td><input type="hidden" name="patient.pId" value="${patient.pId}"></td>
            <td><input type="hidden" name="patient.firstName" value="${patient.firstName}"></td>
            <td><input type="hidden" name="patient.lastName" value="${patient.lastName}"></td>
            <td><input type="hidden" name="patient.email" value="${patient.email}"></td>
            <td><input type="hidden" name="patient.phoneNumber" value="${patient.phoneNumber}"></td>
            <td><input type="hidden" name="patient.address" value="${patient.address}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Add Glucose Level"/></td>
        </tr>
    </table>
</form>
</body>
</html>
