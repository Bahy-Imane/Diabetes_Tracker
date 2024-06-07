<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient's List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap" rel="stylesheet">
    <style>
        @import url("https://fonts.googleapis.com/css?family=DM+Sans:400,500|Jost:400,500,600&display=swap");
        * {
            box-sizing: border-box;
        }

        body {
            color: #2b2c48;
            font-family: "Jost", sans-serif;
            background-image: url(https://images.pexels.com/photos/304664/pexels-photo-304664.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            flex-wrap: wrap;
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

        .button-container {
            margin-top: 120px;
            width: 190px;
            height: 50px;
            display: flex;
            justify-content: end;
            align-items: end;
            padding: 10px;
        }

        .button-container a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 20px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
        }

        .button-container a:hover {
            background-color: #0056b3;
        }

        .card {
            width: 450px;
            margin-top: 120px;
            margin-left: 40%;
            overflow-y: auto;
            z-index: 1;
            overflow-x: hidden;
            background-color: white;
            display: flex;
            justify-content: center;
            transition: 0.3s;
            flex-direction: column;
            border-radius: 10px;
            box-shadow: 0 0 0 8px rgba(255, 255, 255, 0.2);
        }

        .card[data-state="#about"] {
            height: 450px;
        }
        .card[data-state="#about"] .card-main {
            padding-top: 0;
        }

        .card[data-state="#contact"] {
            height: 430px;
        }

        .card[data-state="#experience"] {
            height: 550px;
        }

        .card.is-active .card-header {
            height: 80px;
        }
        .card.is-active .card-cover {
            height: 100px;
            top: -50px;
        }
        .card.is-active .card-avatar {
            transform: none;
            left: 20px;
            width: 50px;
            height: 50px;
            bottom: 10px;
        }
        .card.is-active .card-fullname,
        .card.is-active .card-jobtitle {
            left: 86px;
            transform: none;
        }
        .card.is-active .card-fullname {
            bottom: 18px;
            font-size: 19px;
        }
        .card.is-active .card-jobtitle {
            bottom: 16px;
            letter-spacing: 1px;
            font-size: 10px;
        }

        .card-header {
            position: relative;
            display: flex;
            height: 200px;
            flex-shrink: 0;
            width: 100%;
            transition: 0.3s;
        }
        .card-header * {
            transition: 0.3s;
        }

        .card-cover {
            width: 100%;
            position: absolute;
            height: 160px;
            top: -20%;
            left: 0;
            will-change: top;
            background-size: cover;
            background-position: center;
            filter: blur(30px);
            transform: scale(1.2);
            transition: 0.5s;
        }

        .card-avatar {
            width: 100px;
            height: 100px;
            box-shadow: 0 8px 8px rgba(0, 0, 0, 0.2);
            border-radius: 50%;
            -o-object-position: center;
            object-position: center;
            -o-object-fit: cover;
            object-fit: cover;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%) translateY(-64px);
        }

        .card-fullname {
            position: absolute;
            bottom: 0;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            white-space: nowrap;
            transform: translateY(-10px) translateX(-50%);
            left: 50%;
        }

        .card-jobtitle {
            position: absolute;
            bottom: 0;
            font-size: 11px;
            white-space: nowrap;
            font-weight: 500;
            opacity: 0.7;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin: 0;
            left: 50%;
            transform: translateX(-50%) translateY(-7px);
        }

        .card-main {
            position: relative;
            flex: 1;
            display: flex;
            padding-top: 10px;
            flex-direction: column;
        }

        .card-subtitle {
            font-weight: 700;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .card-content {
            padding: 20px;
        }

        .card-desc {
            line-height: 1.6;
            color: #636b6f;
            font-size: 14px;
            margin: 0;
            font-weight: 400;
            font-family: "DM Sans", sans-serif;
        }

        .card-social {
            display: flex;
            align-items: center;
            padding: 0 20px;
            margin-bottom: 30px;
        }
        .card-social svg {
            fill: #a5b5ce;
            width: 16px;
            display: block;
            transition: 0.3s;
        }
        .card-social a {
            color: #8797a1;
            height: 32px;
            width: 32px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: 0.3s;
            background-color: rgba(93, 133, 193, 0.05);
            border-radius: 50%;
            margin-right: 10px;
        }
        .card-social a:hover svg {
            fill: #637faa;
        }
        .card-social a:last-child {
            margin-right: 0;
        }

        .card-buttons {
            display: flex;
            background-color: #fff;
            margin-top: auto;
            position: sticky;
            bottom: 0;
            left: 0;
        }
        .card-buttons button {
            flex: 1 1 auto;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background: 0;
            font-size: 13px;
            border: 0;
            padding: 15px 5px;
            cursor: pointer;
            color: #5c5c6d;
            transition: 0.3s;
            font-family: "Jost", sans-serif;
            font-weight: 500;
            outline: 0;
            border-bottom: 3px solid transparent;
        }
        .card-buttons button.is-active, .card-buttons button:hover {
            color: #2b2c48;
            border-bottom: 3px solid #8a84ff;
            background: linear-gradient(to bottom, rgba(127, 199, 231, 0) 0%, rgba(207, 204, 255, 0.2) 44%, rgba(211, 226, 255, 0.4) 100%);
        }

        .card-section {
            display: none;
        }
        .card-section.is-active {
            display: block;
            -webkit-animation: fadeIn 0.6s both;
            animation: fadeIn 0.6s both;
        }

        @-webkit-keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translatey(40px);
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translatey(40px);
            }
            100% {
                opacity: 1;
            }
        }
        .card-timeline {
            margin-top: 30px;
            position: relative;
        }
        .card-timeline:after {
            background: linear-gradient(to top, rgba(134, 214, 243, 0) 0%, #516acc 100%);
            content: "";
            left: 42px;
            width: 2px;
            top: 0;
            height: 100%;
            position: absolute;
            content: "";
        }

        .card-item {
            position: relative;
            padding-left: 60px;
            padding-right: 20px;
            padding-bottom: 30px;
            z-index: 1;
        }
        .card-item:last-child {
            padding-bottom: 5px;
        }
        .card-item:after {
            content: attr(data-year);
            width: 10px;
            position: absolute;
            top: 0;
            left: 37px;
            width: 8px;
            height: 8px;
            line-height: 0.6;
            border: 2px solid #fff;
            font-size: 11px;
            text-indent: -35px;
            border-radius: 50%;
            color: rgba(134, 134, 134, 0.7);
            background: linear-gradient(to bottom, #a0aee3 0%, #516acc 100%);
        }

        .card-item-title {
            font-weight: 500;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .card-item-desc {
            font-size: 13px;
            color: #6f6f7b;
            line-height: 1.5;
            font-family: "DM Sans", sans-serif;
        }

        .card-contact-wrapper {
            margin-top: 20px;
        }

        .card-contact {
            display: flex;
            align-items: center;
            font-size: 13px;
            color: #6f6f7b;
            font-family: "DM Sans", sans-serif;
            line-height: 1.6;
            cursor: pointer;
        }
        .card-contact + .card-contact {
            margin-top: 16px;
        }
        .card-contact svg {
            flex-shrink: 0;
            width: 30px;
            min-height: 34px;
            margin-right: 12px;
            transition: 0.3s;
            padding-right: 12px;
            border-right: 1px solid #dfe2ec;
        }

        .contact-me {
            border: 0;
            outline: none;
            background: linear-gradient(to right, rgba(83, 200, 239, 0.8) 0%, rgba(81, 106, 204, 0.8) 96%);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
            color: #fff;
            padding: 12px 16px;
            width: 100%;
            border-radius: 5px;
            margin-top: 25px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            font-family: "Jost", sans-serif;
            transition: 0.3s;
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


<div class="button-container">
    <a href="/Diabetes_Tracker_war_exploded/new">New Patient</a>
</div>
<div class="cards-container">
    <c:forEach items="${listPatient}" var="patient">
        <div class="card">
            <div class="card-header">
                <div class="card-cover" style="background-image: url('https://images.pexels.com/photos/12843338/pexels-photo-12843338.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')"></div>
                <img class="card-avatar" src="${patient.picture}" alt="avatar" />
                <h1 class="card-fullname">${patient.firstName} ${patient.lastName}</h1>
                <h2 class="card-jobtitle">Patient ID: ${patient.pId}</h2>
            </div>
            <div class="card-main">
                <div class="card-section is-active" id="about">
                    <div class="card-content">
                        <div class="card-subtitle">CONTACT INFORMATION</div>
                        <div class="card-contact-wrapper">
                            <div class="card-contact">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                                    <path d="M22 6l-10 7L2 6"/>
                                </svg>
                                    ${patient.email}
                            </div>
                            <div class="card-contact">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16.92z"/>
                                </svg>
                                    ${patient.phoneNumber}
                            </div>
                            <div class="card-contact">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                                    <circle cx="12" cy="10" r="3"/>
                                </svg>
                                    ${patient.address}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex;justify-content: space-evenly" class="card-buttons">
                <a href="/Diabetes_Tracker_war_exploded/homeDiabetes/${patient.pId}" class="details-link"><button>Details</button></a>
                <a href="/Diabetes_Tracker_war_exploded/delete?id=${patient.pId}"><button>Delete</button></a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
<script>
    const buttons = document.querySelectorAll(".card-buttons button");
    const sections = document.querySelectorAll(".card-section");
    const card = document.querySelector(".card");

    const handleButtonClick = e => {
        const targetSection = e.target.getAttribute("data-section");
        const section = document.querySelector(targetSection);
        targetSection !== "#about" ?
            card.classList.add("is-active") :
            card.classList.remove("is-active");
        card.setAttribute("data-state", targetSection);
        sections.forEach(s => s.classList.remove("is-active"));
        buttons.forEach(b => b.classList.remove("is-active"));
        e.target.classList.add("is-active");
        section.classList.add("is-active");
    };

    buttons.forEach(btn => {
        btn.addEventListener("click", handleButtonClick);
    });
</script>
</html>