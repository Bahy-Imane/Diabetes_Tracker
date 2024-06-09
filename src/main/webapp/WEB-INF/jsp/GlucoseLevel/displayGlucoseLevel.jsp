<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>GlucoseLevel's List</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment"></script>

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


        .btn1{
            display: inline-block;
            padding: 10px 20px;
            background-color: #1f67ff;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn1:hover{
            background-color: #0fb0d2;
        }


        .blog-slider {
            width: 95%;
            max-width: 800px;
            margin-top: 120px;
            position: relative;
            top: 50%;
            left:  17%;
            background: #fff;
            box-shadow: 0px 14px 80px rgba(34, 35, 58, 0.2);
            padding: 25px;
            border-radius: 25px;
            height: 300px;
            transition: all 0.3s;
        }

        .blog-slider__item {
            display: flex;
            align-items: center;
            flex-direction: row;
        }

        .blog-slider__img {
            width: 100%;
            max-width: 300px;
            height: 300px;
            background-image: linear-gradient(147deg, #0fb0d2 0%, #1f67ff 74%);
            box-shadow: 4px 13px 30px 1px rgba(52, 90, 90, 0.2);
            border-radius: 20px;
            overflow: hidden;
            margin-bottom: 20px;
            position: relative;
        }

        .blog-slider__img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            border-radius: 20px;
            transition: all 0.3s;
        }

        .blog-slider__content {
            text-align: center;
            padding: 0 20px;
        }

        .blog-slider__code {
            color: #7b7992;
            margin-bottom: 15px;
            display: block;
            font-weight: 500;
        }

        .blog-slider__title {
            font-size: 24px;
            font-weight: 700;
            color: #0d0925;
            margin-bottom: 20px;
        }

        .blog-slider__text {
            color: #4e4a67;
            margin-bottom: 30px;
            line-height: 1.5em;
        }

        .blog-slider__button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1f67ff;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .blog-slider__button:hover {
            background-color: #0fb0d2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .aaa {
            color: #1f67ff;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #1f67ff;
            border-radius: 3px;
            transition: background-color 0.3s, color 0.3s;
        }
        .aaa:hover {
            background-color: #1f67ff;
            color: #fff;
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
    </div>
</nav>




<div class="blog-slider">
    <div class="blog-slider__item">
        <div class="blog-slider__img">
            <img src="https://res.cloudinary.com/muhammederdem/image/upload/q_60/v1535759872/kuldar-kalvik-799168-unsplash.webp" alt="">
        </div>
        <div class="blog-slider__content">
            <span class="blog-slider__code">Welcome</span>
            <div class="blog-slider__title">I wish that you are fine</div>
            <div class="blog-slider__text">Welcome to your account to properly monitor your diabetes</div>
            <a href="/Diabetes_Tracker_war_exploded/new1/${patientId}" class="blog-slider__button">New GlucoseLevel</a>
            <a href="/Diabetes_Tracker_war_exploded/glucose-chart/${patientId}" class="btn1">Track your diabete</a>
        </div>
    </div>
</div>



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
                <a class="aaa" href="/Diabetes_Tracker_war_exploded/deleteGlucose/${glucoseLevel.gId}/${glucoseLevel.patient.pId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="dd.js">
</script>
</script>
</html>
