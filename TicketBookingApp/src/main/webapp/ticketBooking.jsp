<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String movieId = request.getParameter("movieId");

    String movieName = "";
    String imageUrl = "";
    String duration = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbt", "root", "admin@123");
        PreparedStatement ps = conn.prepareStatement("SELECT name, img, duration FROM movies WHERE id = ?");
        ps.setInt(1, Integer.parseInt(movieId));
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            movieName = rs.getString("name");
            imageUrl = rs.getString("img");
            duration = rs.getString("duration");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.println("<h3>Error loading movie: " + e.getMessage() + "</h3>");
    }
%>

<%
    int totalSeats = 60;
    int bookedSeats = 0;
    int remainingSeats = 60;

    String selectedDate = request.getParameter("date");
    String selectedTime = request.getParameter("time");

    if (selectedDate != null && selectedTime != null) {
        try {
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbt", "root", "admin@123");
            PreparedStatement ps2 = conn2.prepareStatement(
                "SELECT SUM(seats) AS totalBooked FROM bookings WHERE movie = ? AND date = ? AND time = ?"
            );
            ps2.setString(1, movieName);
            ps2.setString(2, selectedDate);
            ps2.setString(3, selectedTime);
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                bookedSeats = rs2.getInt("totalBooked");
                remainingSeats = totalSeats - bookedSeats;
            }

            rs2.close();
            ps2.close();
            conn2.close();
        } catch (Exception e) {
            out.println("<h3>Error checking seat availability: " + e.getMessage() + "</h3>");
        }
    }
%>

<html>
<head>
    <title>Book Ticket - <%= movieName %></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #f0f0f0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .booking-form {
            background-color: #1e1e2f;
            padding: 30px 35px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(255, 99, 71, 0.4);
            width: 420px;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: scale(0.95);}
            to {opacity: 1; transform: scale(1);}
        }

        h2 {
            text-align: center;
            color: #ff4e50;
            margin-bottom: 25px;
        }

        .movie-poster {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #ccc;
            margin-top: 10px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            margin-bottom: 15px;
            border: none;
            border-radius: 8px;
            font-size: 0.95em;
            background-color: #2d2d44;
            color: #f0f0f0;
        }

        input:read-only {
            background-color: #2b2b2b;
            color: #aaa;
        }

        button {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            padding: 14px;
            border: none;
            width: 100%;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #ff2a68, #ff6a36);
        }
    </style>
</head>
<body>

<div class="booking-form">
    <h2>Book Your Ticket for "<%= movieName %>"</h2>
    <%
        String x = (String) session.getAttribute("user");
        String y = (String) session.getAttribute("email");
    %>
    <img src="<%= imageUrl %>" alt="<%= movieName %>" class="movie-poster" />
    <form action="<%= request.getContextPath() %>/BookTicket" method="get">
        <input type="hidden" name="movieId" value="<%= movieId %>">
        
        <label>Your Name</label>
        <input type="text" name="hidi" value="<%= x %>" readonly>

        <label>Movie</label>
        <input type="text" name="movie" value="<%= movieName %>" readonly>

        <label>Date</label>
        <input type="date" id="date" name="date" value="<%= selectedDate != null ? selectedDate : "" %>" required>

        <label>Time</label>
        <select name="time" required>
            <option <%= "10:00 AM".equals(selectedTime) ? "selected" : "" %>>10:00 AM</option>
            <option <%= "1:00 PM".equals(selectedTime) ? "selected" : "" %>>1:00 PM</option>
            <option <%= "4:00 PM".equals(selectedTime) ? "selected" : "" %>>4:00 PM</option>
            <option <%= "7:00 PM".equals(selectedTime) ? "selected" : "" %>>7:00 PM</option>
            <option <%= "10:00 PM".equals(selectedTime) ? "selected" : "" %>>10:00 PM</option>
        </select>

        <label>Number of Tickets</label>
        <input type="number" name="seats" min="1" max="<%= remainingSeats %>" required>
        

        <button type="submit">Confirm Booking</button>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const today = new Date().toISOString().split("T")[0];
        document.getElementById("date").setAttribute("min", today);
    });
</script>

</body>
</html>
