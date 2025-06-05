package com.TicketBookingApp.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.cancel;
import com.TicketBookingApp.Model.delete;

/**
 * Servlet implementation class CancelBooking
 */
//@WebServlet("/CancelBooking")
public class CancelBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("cancel");
		System.out.println(name);
		request.setAttribute("name", name);
		cancel can = new cancel(name);
		Connection con = null;
	    //PreparedStatement insertStmt = null;
	    PreparedStatement checkStmt = null;
	    
	    ResultSet rs = null;
	    ResultSet rs1 = null;
	    GetConnection gc = new GetConnection() ;
        try {
        	con = gc.getConnection();
	        String checksql = "SELECT name FROM bookings WHERE name = ?";
	        checkStmt = con.prepareStatement(checksql);
	        checkStmt.setString(1, can.getName());
	        rs = checkStmt.executeQuery();
	        if(rs.next()) {
	        	System.out.println(can.getName()+" is found in Bookinginfo Table");
	        	String dname = request.getParameter("delete");
	        	System.out.println(dname);
	        	request.setAttribute("dname",dname);
	        	delete dele = new delete(dname);
	        	PreparedStatement deleteStmt = null;
	        	String deleteSQL = "DELETE FROM bookings WHERE movie = ?";
	        	try {
	                deleteStmt = con.prepareStatement(deleteSQL);
	                deleteStmt.setString(1, dele.getDname());
	                
	                // Use executeUpdate for DELETE statements
	                int rowsAffected = deleteStmt.executeUpdate();
	                
	                if (rowsAffected > 0) {
	                	System.out.println("no of rows deleted : "+rowsAffected);
	                    System.out.println("Ticket Deleted ");
	                    RequestDispatcher rd = request.getRequestDispatcher("/delete.jsp");
	                    rd.forward(request, response);
	                } else {
	                    System.out.println("No ticket found with the specified name");
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	                System.out.println("An error occurred while trying to delete the ticket");
	            }
	        }
	        else {
	        	System.out.println("name not found");
	        }
	    }catch (Exception e) {
			// TODO: handle exception
	    	e.printStackTrace();
		}
	}
}
