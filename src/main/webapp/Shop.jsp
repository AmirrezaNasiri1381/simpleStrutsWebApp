<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html lang="fa">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin: 20px auto;
            padding: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td img {
            max-width: 100px;
            height: auto;
        }

        td p {
            margin: 5px 0;
        }

        button {
            font-size: 14px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        #myButton {
            font-size: 15px;
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #myButton:hover {
            background-color: #0b7dda;
        }
    </style>
</head>

<body>
<div class="container">
    <!-- فرم Struts -->
    <html:form action="Shop" method="post" styleId="shoppingForm">
        <table>
            <thead>
            <tr>
                <th>تصویر</th>
                <th>توضیحات</th>
                <th>افزودن به سبد خرید</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="image/download.jpg" alt="Persian Rug"></td>
                <td>
                    <p>فرش ایرانی</p>
                    <p>قیمت: 1500</p>
                </td>
                <td><input type="checkbox" name="productIds" value="rug" onclick="addToCart('rug')" /></td>
            </tr>
            <tr>
                <td><img src="image/laptop.jpg" alt="Laptop"></td>
                <td>
                    <p>لپ‌تاپ</p>
                    <p>قیمت: 1000</p>
                </td>
                <td><input type="checkbox" name="productIds" value="laptop" onclick="addToCart('laptop')" /></td>
            </tr>
            </tbody>
        </table>
        <br />
        <html:hidden property="cart" styleId="cart"/>
        <!-- ارسال فرم -->
        <html:hidden property="method" styleId="method"/>
        <html:submit value="خرید" styleId="myButton" onclick="buy()" />
    </html:form>
</div>

<script>
    let cart = [];

    // افزودن به سبد خرید
    function addToCart(productName) {
        // اگر محصول قبلاً به سبد اضافه شده باشد، دوباره اضافه نشود
        if (!cart.includes(productName)) {
            cart.push(productName);
            alert(productName + " به سبد خرید اضافه شد.");
        }
    }

    // ارسال فرم به سرور
    function buy() {
        console.log("محصولات انتخاب شده: " + cart.join(", "));
        alert("محصولات در کنسول چاپ شد.");

        // داده‌ها را به صورت چک‌باکس‌ها به فرم اضافه می‌کنیم
        const checkboxes = document.getElementsByName('productIds');
        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked && !cart.includes(checkboxes[i].value)) {
                cart.push(checkboxes[i].value);
            }
        }
        document.getElementById("cart").value = cart.join(",");
        // ارسال فرم با استفاده از جاوااسکریپت
        document.getElementById("method").value = "showOrderCart";
        document.getElementById('shoppingForm').submit();
    }
</script>

</body>
</html>
