<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Movies</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #111;
            color: #fff;
            margin: 0;
            padding: 20px;
        }

        .navbar {
            background-color: #111;
            overflow: hidden;
            display: flex;
            align-items: center;
            padding: 10px 20px;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 17px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #575757;
            border-radius: 4px;
        }

        .navbar img {
            height: 30px;
            margin-left: 8px;
            vertical-align: middle;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            color: #f7c331;
            margin: 30px 0 10px;
        }

        .movie-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 40px; /* more space between cards */
    padding: 30px;
}

.movie-card {
    background-color: #1e1e1e;
    width: 380px; /* increased from 320px */
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.7);
    transition: transform 0.3s, box-shadow 0.3s;
    display: flex;
    flex-direction: column;
}

.movie-card img {
    width: 100%;
    height: 520px; /* increased image height */
    object-fit: cover;
    background-color: #000;
}

.movie-title {
    font-size: 22px; /* slightly larger title */
}

.movie-duration {
    font-size: 15px;
}

        .book-button {
            background-color: #f7c331;
            color: #000;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .book-button:hover {
            background-color: #e6b800;
        }

        .error-message {
            color: #ff4d4d;
            text-align: center;
            padding: 20px;
            background-color: #2a2a2a;
            border-radius: 8px;
            margin: 40px auto;
            width: 80%;
        }
    </style>
</head>
<body>

<%
    String jdbcURL = "jdbc:mysql://localhost:3306/mbt";
    String jdbcUsername = "root";
    String jdbcPassword = "admin@123";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "SELECT id, name, img, duration FROM movies";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<div class="navbar">
    <a href="movies.jsp">Movies</a>
    <a href="upcoming.jsp">Upcoming Movies</a>
    <div class="right">
        <a href="getTicket.jsp">Get Ticket
            <img src="https://cdn-icons-png.flaticon.com/512/7375/7375487.png" alt="Ticket Icon">
        </a>
        <a href="cancel.jsp">Cancel</a>
        <a href="getTicketLogin.jsp">TicketLogin</a>
    </div>
</div>

<h1>Available Movies</h1>

<div class="movie-grid">
    <% while(rs.next()) {
        int movieId = rs.getInt("id");
        String name = rs.getString("name");
        String imageUrl = rs.getString("img");
        String duration = rs.getString("duration");
    %>
    <div class="movie-card">
        <img src="<%= imageUrl %>" alt="<%= name %>" />
        <div class="movie-info">
            <div class="movie-title"><%= name %></div>
            <div class="movie-duration">Duration: <%= duration %></div>
            <form action="ticketBooking.jsp" method="post" style="margin-top: 10px;">
                <input type="hidden" name="movieId" value="<%= movieId %>" />
                <button type="submit" class="book-button">Book Now</button>
            </form>
        </div>
    </div>
    <% } %>
</div>

<%
    } catch(Exception e) {
%>
    <div class="error-message">
        <strong>Error loading movies:</strong> <%= e.getMessage() %>
    </div>
<%
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception ignored) {}
        try { if(ps != null) ps.close(); } catch(Exception ignored) {}
        try { if(conn != null) conn.close(); } catch(Exception ignored) {}
    }
%>

</body>
</html>
