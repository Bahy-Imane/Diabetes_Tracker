<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .segment {
            margin-bottom: 20px;
        }

        .segment h1 {
            font-size: 24px;
            margin: 0;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="url"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button.red {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button.red:hover {
            background-color: #0056b3;
        }

        img#previewImg {
            max-width: 100%;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

    </style>
</head>
<body>
<div>
<h2>Add Patient</h2>
    <div class="form-container">
        <form action="addPatientAction" method="post" modelAttribute="patient">
            <div class="segment">
                <h1>Add Patient</h1>
            </div>

            <label>
                <input type="text" name="firstName" placeholder="First Name">
            </label>
            <label>
                <input type="text" name="lastName" placeholder="Last Name">
            </label>
            <label>
                <input type="text" name="email" placeholder="Email">
            </label>
            <label>
                <input type="text" name="phoneNumber" placeholder="Phone Number">
            </label>
            <label>
                <input type="text" name="address" placeholder="Address">
            </label>
            <label>
                <input type="url" id="picture" name="picture" placeholder="Project Image URL" required>
            </label>
            <img id="previewImg" src="" alt="Project Image Preview" style="display:none;">

            <button class="red" type="submit">Add</button>
        </form>
    </div>
</div>

</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const pictureInput = document.getElementById('picture');
        const previewImg = document.getElementById('previewImg');

        pictureInput.addEventListener('input', function () {
            const url = pictureInput.value;
            if (url) {
                previewImg.src = url;
                previewImg.style.display = 'block';
            } else {
                previewImg.style.display = 'none';
            }
        });
    });
</script>
</html>

