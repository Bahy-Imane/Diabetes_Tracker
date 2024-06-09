<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Graphique des Niveaux de Glucose</title>
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



<h1 style="margin-top: 60px; display: flex;justify-content: center;font-family:Dancing Script, cursive;color:#ffffff; font-size: 30px;">>Grafic of Glucose Level of Patient</h1>
<div style="width: 75%; margin: auto;">
    <canvas id="glucoseChart"></canvas>
</div>
<script>

    const glucoseLevels = /*[[${glucoseLevels}]]*/ '[]';
    const parsedGlucoseLevels = JSON.parse(glucoseLevels);


    const labels = parsedGlucoseLevels.map(data => data.dateTime);
    const data = parsedGlucoseLevels.map(data => data.glucoseLevel);


    const ctx = document.getElementById('glucoseChart').getContext('2d');
    const glucoseChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Niveau de Glucose',
                data: data, 
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderWidth: 1,
                fill: true,
            }]
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'day',
                        tooltipFormat: 'DD MMM YYYY, h:mm:ss a',
                        displayFormats: {
                            day: 'DD MMM YYYY'
                        }
                    },
                    title: {
                        display: true,
                        text: 'Date et Heure'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Niveau de Glucose (mg/dL)'
                    },
                    beginAtZero: false
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Niveau de Glucose pour Chaque Jour et Heure'
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return `Niveau de Glucose: ${context.parsed.y} mg/dL`;
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>
