<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0a0a0a;
            margin: 0;
            padding: 0;
            color: #eaeaea;
        }

        .navbar {
            background-color: #111;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #00ffff;
        }

        .navbar a {
            color: #00ffff;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #f7c331;
            border-bottom: 2px solid #f7c331;
        }

        .navbar .right {
            display: flex;
        }

        .confirm-blast {
            margin-top: 100px;
            text-align: center;
            font-size: 30px;
            color: #00ff88;
            font-weight: bold;
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #00ff88, 0 0 20px #00ff88;
            }
            to {
                text-shadow: 0 0 20px #00ffaa, 0 0 40px #00ffaa;
            }
        }

        h2 {
            text-align: center;
            color: #f7c331;
            margin-top: 20px;
            font-weight: normal;
        }

        .ticket-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .ticket-card {
            background-color: #1a1a1a;
            border: 1px solid #333;
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            box-shadow: 0 0 10px #00ffff;
        }

        .ticket-info {
            font-size: 18px;
            margin: 15px 0;
            color: #ccc;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="movies.jsp">Movies</a>
            <a href="upcoming.jsp">Upcoming</a>
        </div>
        <div class="right">
            <a href="cancel.jsp">Cancel</a>
            
        </div>
    </div>

    <div class="confirm-blast">Booking Cancelled!</div>

    <h2>Thank you for visiting.<br>See you again at the movies!</h2>
    <div style="text-align: center; margin-bottom: 20px;">
    <form action="logout.jsp" method="post" style="display: inline;">
        <button type="submit" style="background-color: #dc3545; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer;">Logout</button>
    </form>
</div>

</body>
</html>
