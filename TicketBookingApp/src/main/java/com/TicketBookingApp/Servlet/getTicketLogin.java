package com.TicketBookingApp.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.cancel;
import com.TicketBookingApp.Model.delete;

/**
 * Servlet implementation class getTicketLogin
 */
//@WebServlet("/getTicketLogin")
public class getTicketLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTicketLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
        String movie = request.getParameter("movie");

        try (Connection con = new GetConnection().getConnection()) {
            String sql = "SELECT * FROM bookings WHERE name = ? AND movie = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, movie);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Set booking data to show on JSP
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("numSeat", rs.getString("numSeat"));
                request.setAttribute("time", rs.getString("time"));

                request.setAttribute("date", rs.getString("date"));

                request.setAttribute("movie", rs.getString("movie"));

                
                
                RequestDispatcher rd = request.getRequestDispatcher("getTicket.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("message", "No ticket found for the given name and movie.");
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}

