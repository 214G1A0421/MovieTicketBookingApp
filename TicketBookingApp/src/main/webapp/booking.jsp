<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Movie Booking Page</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: white;
        }

        .navbar {
            background-color: #0d0d0d;
            overflow: hidden;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.6);
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
            height: 24px;
            margin-left: 8px;
        }

        .navbar .right {
            margin-left: auto;
        }

        .hero-image {
            width: 100%;
            height: 500px;
            object-fit: cover;
            display: block;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
        }

        .content {
            padding: 30px;
            text-align: center;
        }

        .content h2 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #ffffff;
        }

        .content p {
            font-size: 18px;
            color: #dddddd;
        }
    </style>
</head>
<body>

<!-- Navbar -->
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

<!-- Image Banner -->
<img class="hero-image" src="https://wallpapers.com/images/hd/movie-theater-pictures-800-x-800-itv2fyqylv6mex00.jpg" alt="Movie Theater">

<!-- Content -->
<div class="content">
    <h2>Welcome to the Movie Ticket Booking Portal</h2>
    <p>Book your favorite movie tickets easily and quickly!</p>
</div>

</body>
</html>
