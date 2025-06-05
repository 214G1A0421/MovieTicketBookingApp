<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Movie Booking App</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), 
                    url('https://tse4.mm.bing.net/th?id=OIP.emCCKHIA8zM2Zp2tKxGNmQHaEK&pid=Api&P=0&h=180') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 420px;
        margin: 60px auto;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.2);
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.4);
        color: #fff;
    }

    h1 {
        text-align: center;
        color: #ffffff;
        margin-bottom: 10px;
    }

    p {
        text-align: center;
        color: #dddddd;
        margin-bottom: 20px;
    }

    input[type="text"], input[type="password"], input[type="date"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0 16px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 15px;
        background-color: rgba(255, 255, 255, 0.9);
        color: #000;
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 6px;
        color: #f1f1f1;
    }

    input[type="checkbox"] {
        margin-right: 8px;
    }

    .clearfix {
        display: flex;
        justify-content: space-between;
        margin-top: 15px;
    }

    .signupbtn, .cancelbtn, .loginbtn {
        width: 32%;
        padding: 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .signupbtn {
        background-color: #2575fc;
        color: white;
    }

    .signupbtn:hover {
        background-color: #1a5dd2;
    }

    .cancelbtn {
        background-color: #f05454;
        color: white;
    }

    .cancelbtn:hover {
        background-color: #c0392b;
    }

    .loginbtn {
        background-color: #4CAF50;
        color: white;
    }

    .loginbtn:hover {
        background-color: #45a049;
    }

    hr {
        border: 1px solid #ddd;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<%
    String error = request.getParameter("error");
    if ("userexists".equals(error)) {
%>
    <script>alert("User already exists! Please log in.");</script>
<%
    } else if ("failed".equals(error)) {
%>
    <script>alert("Registration failed. Please try again.");</script>
<%
    }
%>
<form action="<%=request.getContextPath() %>/Register" method="get">
  <div class="container">
    <h1>Register Now</h1>
    <p>Create an account to book your movie tickets!</p>
    <hr>

    <label for="name">Name:</label>
    <input type="text" placeholder="Enter your Name" name="name" required>
    
    <label for="dob">Date of Birth:</label>
    <input type="date" name="dob" required>

    <label for="email">Email:</label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw">Password:</label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>

    <div class="clearfix">
      <button type="button" class="cancelbtn" onclick="window.location.href='index.jsp'">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
      
      <button type="button" class="loginbtn" onclick="window.location.href='login.jsp'">Login</button>
    </div>
  </div>
</form>
</body>
</html>
