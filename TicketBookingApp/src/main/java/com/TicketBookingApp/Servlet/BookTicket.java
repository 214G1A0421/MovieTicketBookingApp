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

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.movieInfo;

/**
 * Servlet implementation class BookTicket
 */
//@WebServlet("/BookTicket")
public class BookTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int Max_SEATS=60;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("hidi");
		String movie = request.getParameter("movie");
        String numSeat = request.getParameter("seats");
        String time = request.getParameter("time");
        String date = request.getParameter("date");
        request.setAttribute("name", name);
        request.setAttribute("movie", movie);
        request.setAttribute("numSeat", numSeat);
        request.setAttribute("time", time);
        request.setAttribute("date", date);
        RequestDispatcher rd = request.getRequestDispatcher("/getTicket.jsp");
        rd.forward(request, response);
        
       movieInfo mi = new movieInfo(name,numSeat,time,date,movie);

        try (Connection con = new GetConnection().getConnection()) {
            String sql = "INSERT INTO bookings (id,name, numSeat, time, date, movie) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, mi.getId());
            ps.setString(2, mi.getName());
            ps.setString(3, mi.getNumSeat());
            ps.setString(4, mi.getTime());
            ps.setString(5, mi.getDate());
            ps.setString(6, mi.getMovie());
     
            ps.executeUpdate();
            response.sendRedirect("getTicket.jsp"); 
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
            response.getWriter().println("Error booking ticket.");
        }
	}

}
