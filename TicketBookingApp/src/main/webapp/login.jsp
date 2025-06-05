<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url("https://repository-images.githubusercontent.com/299409710/b42f7780-0fe1-11eb-8460-e459acd20fb4");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        margin: 0;
        padding: 0;
    }

    .container {
        padding: 24px;
        width: 400px;
        margin: 100px auto;
        border-radius: 8px;
        color: white;
    }

    input[type=email], input[type=password], button {
        width: 100%;
        padding: 12px;
        margin: 8px 0 16px 0;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
    }

    input[type=email], input[type=password] {
        background-color: rgba(255,255,255,0.1);
        color: white;
        border: 1px solid #ccc;
    }

    input::placeholder {
        color: #ddd;
    }

    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #66cc99;
    }

    .cancelbtn {
        background-color: #f44336;
    }

    .cancelbtn:hover {
        background-color: #ff1a1a;
    }

    .footer {
        text-align: center;
        color: white;
        margin-top: 20px;
    }
</style>

</head>
<body>
<form action="<%=request.getContextPath()%>/Login" method="get">
    <div class="container">
        <h2 style="text-align:center;">Login</h2>

        <label for="uname"><b>Email</b></label>
        <input type="email" placeholder="Enter email" name="uname" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>
        <button type="button" onclick="window.location.href='index.jsp'" class="cancelbtn">Cancel</button>
       <a href="changePassword.jsp">Settings</a>
        
    </div>
</form>


<div class="footer">
    &copy; 2025 Ticket Booking App
</div>

</body>
</html>
