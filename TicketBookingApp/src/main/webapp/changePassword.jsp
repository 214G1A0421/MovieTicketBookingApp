<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        body {
            background: linear-gradient(135deg, #1f4037, #99f2c8);
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        .message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Change Password</h2>
        <form action="changePassword" method="get">
            <label for="username">Username:</label>
            <input type="text" name="username" required>

            <label for="oldPassword">Old Password:</label>
            <input type="password" name="oldPassword" required>

            <label for="newPassword">New Password:</label>
            <input type="password" name="newPassword" required>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" name="confirmPassword" required>

            <button type="submit">Update Password</button>
            <a href="login.jsp" class="login-link">Back to Login</a>
        </form>
        <% 
            String msg = request.getParameter("msg");
            if (msg != null) {
        %>
            <div class="message"><%= msg %></div>
        <% } %>
    </div>
</body>
</html>
