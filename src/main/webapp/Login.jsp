<%-- Created by IntelliJ IDEA.
     User: Sorena
     Date: 11/19/2024
     Time: 10:56 AM
     To change this template use File | Settings | File Templates. --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean-1.2.8.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic-1.2.8.tld" prefix="logic" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .center-div {
            width: 400px;
            height: 200px;
            background-color: whitesmoke;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: large;
            font-family: 'Courier New', Courier, monospace;
        }

        p {
            color: red;
        }

        a {
            text-decoration: none;
            color: white;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        .button-secondary {
            background-color: #007BFF;
        }

        .button a {
            color: white;
        }
    </style>
</head>

<body>
<html:form action="Login" method="post" styleId="formId">
    <div class="center-div">

            <%--        <html:messages id="message" message="true" >--%>
            <%--            <p><bean:write name="message" /></p>--%>
            <%--        </html:messages>--%>


        <html:hidden property="tag" styleId="tag"/>
        <label for="username">UserName :</label>
        <html:text property="username" styleId="username" style="width: 100%; padding: 5px;"/>
        <html:errors property="username"/>
        <br/><br/>

        <label for="password">Password :</label>
        <html:password property="password" styleId="password" style="width: 100%; padding: 5px;"/>
        <html:errors property="password"/>
        <br/><br/>

        <html:submit value="submit" styleClass="button"/>

        <button class="button button-secondary">
            <a href="Register.do">Register</a>
        </button>
    </div>
</html:form>

</body>

<script>
    window.onload = function () {
        // افزودن رویداد برای دکمه submit
        document.addEventListener("click", function () {
            document.getElementById("tag").value = "Login";
        });

        // جلوگیری از تغییر مقدار tag هنگام کلیک روی دکمه‌های دیگر
        document.getElementById("formId").addEventListener("submit", function () {
            if (document.getElementById("tag").value !== "Login") {
                document.getElementById("tag").value = "";
            }
        });
    };
</script>

</html>