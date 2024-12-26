<%@ taglib uri="/WEB-INF/struts-bean-1.2.8.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic-1.2.8.tld" prefix="logic" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .cart-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .item-name {
            font-size: 16px;
        }

    </style>
</head>
<body>
<div class="cart-container">
    <h2>Your Shopping List</h2>

    <logic:iterate name="cartItems" id="item">
        <div class="cart-item">
            <span class="item-name"><bean:write name="item" /></span>

        </div>
    </logic:iterate>
</div>
</body>
</html>
