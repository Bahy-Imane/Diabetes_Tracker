<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Glucose Level</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: darkblue;
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            height: 96px;
        }

        .navbar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            flex-wrap: wrap;
        }

        .navbar-brand {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
            margin-right: auto;
        }



        .navbar-menu {
            display: flex;
            gap: 15px;
        }

        .navbar-link {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
            margin-top: 25px;
        }

        .navbar-link:hover {
            background-color: #575757;
        }

        @media (max-width: 768px) {
            .navbar-menu {
                display: none;
                flex-direction: column;
                width: 100%;
            }

            .navbar-menu.active {
                display: flex;
            }

        }

        .card {
            background-color: #ffffff;
            border-radius: 6px;
            box-shadow: 0 12px 35px 0 rgba(16, 39, 112, 0.07);
            padding: 20px;
            max-width: 400px;
            margin: auto;
            text-align: center;
        }

        .card h2 {
            font-size: 24px;
            color: #102770;
            margin-bottom: 20px;
        }

        .card form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .card input[type="datetime-local"], .card input[type="text"], .card input[type="submit"] {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .card input[type="submit"] {
            background-color: #102770;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .card input[type="submit"]:hover {
            background-color: #575757;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <div>
        <div class="navbar-container">
            <a href="${pageContext.request.contextPath}" class="navbar-brand"><img src="https://diabete-enfants.ca/wp-content/uploads/2022/04/Glycemie.png" height="90px" ></a>
        </div>
    </div>
    <div class="navbar-menu" id="navbarMenu">
        <a href="${pageContext.request.contextPath}" class="navbar-link">Accueil</a>
        <a href="${pageContext.request.contextPath}/about" class="navbar-link">A propos de nous</a>
        <a href="${pageContext.request.contextPath}/homePatient" class="navbar-link" id="signupLink">My account</a>
    </div>
</nav>

<div class="card">
    <h2>Add New Glucose Level</h2>
    <form action="/Diabetes_Tracker_war_exploded/addGlucoseLevel" method="post">
        <input type="datetime-local" name="dateTime" required/>
        <input type="text" step="0.01" name="glucoseLevel" required/>
        <input type="hidden" name="patient.pId" value="${patient.pId}">
        <input type="hidden" name="patient.firstName" value="${patient.firstName}">
        <input type="hidden" name="patient.lastName" value="${patient.lastName}">
        <input type="hidden" name="patient.email" value="${patient.email}">
        <input type="hidden" name="patient.phoneNumber" value="${patient.phoneNumber}">
        <input type="hidden" name="patient.address" value="${patient.address}">
        <input type="submit" value="Add Glucose Level"/>
    </form>
</div>

</body>
</html>
