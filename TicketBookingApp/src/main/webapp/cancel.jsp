<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Ticket</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #111;
        color: #fff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .navbar {
        background-color: #222;
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

    .right {
        margin-left: auto;
    }

    .form-container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 20px;
    }

    fieldset {
        border: 2px solid #f7c331;
        border-radius: 10px;
        padding: 30px 40px;
        background-color: #1e1e1e;
        box-shadow: 0 0 15px rgba(247, 195, 49, 0.3);
    }

    form table {
        width: 100%;
    }

    label {
        font-size: 16px;
        color: #f7c331;
    }

    input[type="text"] {
        padding: 8px;
        width: 100%;
        border-radius: 5px;
        border: none;
        margin-top: 5px;
        margin-bottom: 15px;
    }

    button {
        background-color: #f7c331;
        color: #111;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background-color: #fff;
        color: #000;
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

<div class="form-container">
    <fieldset>
        <form action="<%=request.getContextPath()%>/CancelBooking" method="get">
            <table>
                <tr>
                    <td><label for="cancel">Name:</label></td>
                    <td><input type="text" id="cancel" name="cancel" required></td>
                </tr>
                <tr>
                    <td><label for="delete">Movie:</label></td>
                    <td><input type="text" id="delete" name="delete" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <button type="submit">Submit</button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
</div>

</body>
</html>
