<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean-1.2.8.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic-1.2.8.tld" prefix="logic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fa">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ثبت‌نام</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Tahoma', sans-serif;
            background-color: #f4f4f9;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            font-size: 1rem;
            margin-bottom: 8px;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .alert {
            padding: 15px;
            border-radius: 5px;
            font-size: 0.875rem;
            margin-bottom: 12px;
            border: 1px solid transparent;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .link {
            display: block;
            margin-top: 10px;
            text-align: center;
            text-decoration: none;
            color: #007bff;
            font-size: 0.875rem;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<html:form action="Register" method="post" styleId="formId">
    <div class="form-container">
        <logic:equal value="true" name="isValid">
            <div class="alert alert-danger">
                <bean:message bundle="myMessages" key="noAccess.message" />
            </div>
        </logic:equal>
        <logic:equal value="true" name="isNotValid">
            <div class="alert alert-success">
                <bean:message bundle="myMessages" key="Welcome.message" />
            </div>
        </logic:equal>

        <html:hidden property="method" styleId="method"/>
        <h1>فرم ثبت‌نام</h1>
        <label for="username">نام کاربری:</label>
        <html:text property="username" styleId="username"/>
        <p class="error-message" id="checkInput"></p>

        <label for="password">رمز عبور:</label>
        <html:password property="password" styleId="password"/>
        <p class="error-message" id="checkPass"></p>

        <button type="button" onclick="checkInput()">ثبت‌نام</button>
        <html:link page="/Login.do">بازگشت به ورود</html:link>
    </div>
</html:form>

<script>
    function checkInput() {
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value.trim();

        let valid = true;

        if (!username) {
            document.getElementById("checkInput").textContent = "نام کاربری خود را وارد کنید.";
            valid = false;
        } else {
            document.getElementById("checkInput").textContent = "";
        }

        if (!password) {
            document.getElementById("checkPass").textContent = "رمز عبور خود را وارد کنید.";
            valid = false;
        } else if (!validateInput(password)) {
            document.getElementById("checkPass").textContent = "رمز عبور باید حداقل ۸ کاراکتر و شامل حروف و اعداد باشد.";
            valid = false;
        } else {
            document.getElementById("checkPass").textContent = "";
        }

        if (valid) {
            document.getElementById("method").value = "Register";
            document.getElementById("formId").submit();
        }
    }

    function validateInput(input) {
        const regex = /^(?=.*[A-Za-z])(?=.*\d).{8,}$/;
        return regex.test(input);
    }

    window.onload = function () {
        document.getElementById("formId").addEventListener("submit", function () {
            document.getElementById("method").value = "Register";
        });
    };
</script>
</body>

</html>
