<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>

<html>
<head>
    <title>Your Tickets</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #000; /* black background */
            background-image: url("https://wallpaperaccess.com/full/2076081.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding: 20px;
            color: #f0f0f0;
        }

        .navbar {
            background-color: #111;
            display: flex;
            align-items: center;
            padding: 12px 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .navbar a {
            color: #f1f1f1;
            padding: 10px 18px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #1a1a1a;
            border-radius: 6px;
            color: #00ffcc;
        }

        .navbar img {
            height: 24px;
            margin-left: 6px;
            vertical-align: middle;
        }

        .navbar .right {
            margin-left: auto;
        }

        h2 {
            text-align: center;
            color: #00ffcc;
            margin-top: 40px;
        }

        .message {
            text-align: center;
            font-size: 20px;
            color: #ffffff;
            margin-top: 20px;
        }

        .confirm-blast {
            text-align: center;
            font-size: 24px;
            color: #00ff00;
            font-weight: bold;
            margin: 15px 0;
            animation: blast 1s ease-in-out;
        }

        @keyframes blast {
            0% { transform: scale(0.8); opacity: 0; }
            50% { transform: scale(1.1); opacity: 1; }
            100% { transform: scale(1); }
        }

        .ticket-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .ticket-card {
            background: rgba(25, 25, 25, 0.95);
            padding: 30px;
            border-radius: 16px;
            width: 400px;
            box-shadow: 0 6px 20px rgba(0, 255, 204, 0.3);
            backdrop-filter: blur(4px);
            border: 1px solid #00ffcc33;
        }

        .ticket-info {
            font-size: 18px;
            color: #e0e0e0;
            margin: 14px 0;
            line-height: 1.6;
        }

        .ticket-info strong {
            color: #00ffcc;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="movies.jsp">Movies</a>
        <a href="upcoming.jsp">Upcoming Movies</a>
        <div class="right">
            <a href="getTicket.jsp">Get Ticket
                <img src="https://cdn-icons-png.flaticon.com/512/7375/7375487.png" alt="Ticket Icon">
            </a>
            <a href="cancel.jsp">Cancel</a>
            <a href="delete.jsp">Delete</a>
        </div>
    </div>

    <div class="message">Have a great day! Enjoy the movie!</div>
    <div class="confirm-blast">Booking Confirmed!</div>
    <h2>Your Booked Tickets</h2>

    <form action="action=<%=request.getContextPath()%>/getTicket" method="get">
        <div class="ticket-container">
            <div class="ticket-card">
                <div class="ticket-info"><strong>Name:</strong> <%= request.getAttribute("name") %></div>
                <div class="ticket-info"><strong>Movie Name:</strong> <%= request.getAttribute("movie") %></div>
                <div class="ticket-info"><strong>Seats:</strong> <%= request.getAttribute("numSeat") %></div>
                <div class="ticket-info"><strong>Time:</strong> <%= request.getAttribute("time") %></div>
                <div class="ticket-info"><strong>Date:</strong> <%= request.getAttribute("date") %></div>
            </div>
        </div>
    </form>
</body>
</html>
