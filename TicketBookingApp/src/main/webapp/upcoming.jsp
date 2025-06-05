<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Upcoming Movies</title>
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

        .header {
            font-size: 32px;
            color: #f7c331;
            margin: 30px 0 10px;
            text-align: center;
        }

        .movie-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .movie-card {
            background-color: #1e1e1e;
            width: 320px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .movie-card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.9);
        }

        .video-container {
            width: 100%;
            height: 180px;
            overflow: hidden;
        }

        .video-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .movie-info {
            padding: 15px;
        }

        .movie-title {
            font-size: 20px;
            font-weight: bold;
            color: #f7c331;
            margin-bottom: 10px;
        }

        .movie-release {
            color: #aaa;
            font-size: 14px;
            margin-bottom: 5px;
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
    </div>
</div>

<div class="header">Upcoming Movies</div>

<div class="movie-container">
<%
    String dbURL = "jdbc:mysql://localhost:3306/mbt";
    String dbUser = "root";
    String dbPass = "admin@123";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM upcoming");

        while (rs.next()) {
            String title = rs.getString("name");
            String releaseDate = rs.getString("release_date");
            String URL = rs.getString("url"); // embeddable video URL
%>
    <div class="movie-card">
        <div class="video-container">
            <iframe src="<%= URL %>" allowfullscreen></iframe>
        </div>
        <div class="movie-info">
            <div class="movie-title"><%= title %></div>
            <div class="movie-release">Release Date: <%= releaseDate %></div>
        </div>
    </div>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</div>

</body>
</html>
