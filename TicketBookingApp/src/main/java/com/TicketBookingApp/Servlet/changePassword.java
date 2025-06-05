package com.TicketBookingApp.Servlet;

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
import java.sql.Statement;

import com.TicketBookingApp.Connection.GetConnection;

/**
 * Servlet implementation class ChangePassword
 */
//@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("changePassword.jsp?msg=Passwords do not match");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbt", "root", "admin@123");

            // Check if user and old password match
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM register WHERE name=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                // Update password
                PreparedStatement update = conn.prepareStatement("UPDATE register SET password=? WHERE name=?");
                update.setString(1, newPassword);
                update.setString(2, username);
                int i = update.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("changePassword.jsp?msg=Password updated successfully");
                } 
                else 
                {
                    response.sendRedirect("changePassword.jsp?msg=Failed to update password");
                }
            } 
            
            else {
                response.sendRedirect("changePassword.jsp?msg=Invalid old password");
            }

            rs.close();
            ps.close();
            conn.close();
        } 
        catch (Exception e)
        {
            e.printStackTrace();
            response.sendRedirect("changePassword.jsp?msg=Error: " + e.getMessage());
        }
    
	}

}
