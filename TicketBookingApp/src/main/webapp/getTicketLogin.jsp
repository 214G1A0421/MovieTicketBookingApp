<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Login | Movie Booking App</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                        url('https://tse3.mm.bing.net/th?id=OIP.PoTZuFTbN3L_eNv4y07oTwHaEK&pid=Api&P=0&h=180') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #f1f1f1;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #ff4c4c;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #e63737;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Retrieve Your Ticket</h2>
        <form action="getTicketLogin" method="get">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="movie">Movie:</label>
            <input type="text" name="movie" required>

            <button type="submit">Get Ticket</button>
        </form>
    </div>
</body>
</html>
