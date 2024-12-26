<%@ page import="com.example.webapp.Entities.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fa">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>خوش‌آمدید</title>
    <style>
        /* تنظیمات کلی برای صفحه */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Tahoma', sans-serif;
            background-color: #f4f4f9;
        }

        .center-div {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        p {
            color: #28a745;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            font-size: 1rem;
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>

<body>
<form method="get" action="Welcome.do" id="formId">
    <div class="center-div">
        <p>به صفحه ما خوش‌آمدید</p>
        <button type="button" onclick="alertn()">نمایش پیام</button>
        <a href="Shop.jsp">نمایش محصولات</a>
    </div>
</form>

<script>
    function alertn() {
        alert("به سایت ما خوش آمدید!");
    }
</script>
</body>

</html>
