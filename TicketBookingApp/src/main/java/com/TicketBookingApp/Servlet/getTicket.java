package com.TicketBookingApp.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class getTicket
 */
//@WebServlet("/getTicket")
public class getTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 PrintWriter out = response.getWriter();
		jakarta.servlet.http.HttpSession session = request.getSession(false);
	    String username = (String) session.getAttribute("username");

	    if (username == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    out.println("<html><head><title>Your Tickets</title>");
	    out.println("<style>");
	    out.println("body { font-family: Arial; background-color: #f2f2f2; padding: 20px; }");
	    out.println(".ticket-card { background: white; padding: 20px; margin-bottom: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); width: 400px; }");
	    out.println("</style>");
	    out.println("</head><body>");
	    out.println("<h2>Welcome, " + username + "! Here are your tickets:</h2>");

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbt", "root", "admin@123");

	        String sql = "SELECT * FROM bookings WHERE name = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, username);
	        ResultSet rs = ps.executeQuery();

	        boolean found = false;

	        while (rs.next()) {
	            found = true;
	            out.println("<div class='ticket-card'>");
	            out.println("<h3>User: " + rs.getString("name") + "</h3>");
	            out.println("<p><strong>Seats:</strong> " + rs.getInt("numSeat") + "</p>");
	            out.println("<p><strong>Time:</strong> " + rs.getString("time") + "</p>");
	            out.println("<p><strong>Date:</strong> " + rs.getString("date") + "</p>");
	            out.println("</div>");
	        }

	        if (!found) {
	            out.println("<p>No tickets found for you!</p>");
	        }

	        con.close();

	    } catch (Exception e) {
	        out.println("<p>Error: " + e.getMessage() + "</p>");
	    }

	    out.println("</body></html>");
	}
	}


