<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page session="true" %>
<%
    session.invalidate(); // Ends the current session
    response.sendRedirect("login.jsp"); // Redirects to login page
%>
</body>
</html>