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

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.loginInfo;

/**
 * Servlet implementation class Login
 */
//@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		// TODO Auto-generated method stub
				String url="jdbc:mysql://localhost:3306/Mbt";
				String username="root";
				String password="admin@123";
				Connection con=null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					System.out.println("Loaded and Registered the Driver");
					con=DriverManager.getConnection(url,username,password);
					System.out.println("Connection Established");
					String name=request.getParameter("uname");
					String pswd=request.getParameter("psw");
					PreparedStatement pst=con.prepareStatement("select * from register where email=? and password=?");
					pst.setString(1,name);
					pst.setString(2, pswd);
					ResultSet rs=pst.executeQuery();
						 if (rs.next()) {
							 
			                    // Extract the domain
			                    String domain = name.substring(name.indexOf("@") + 1).toLowerCase();

			                    if (domain.equals("admin.com")) {
			                        response.sendRedirect("Admin.jsp");
			                    } else {
			                	   	String username1=rs.getString("name");
			                    	request.getSession().setAttribute("user",username1);
			                        response.sendRedirect("movies.jsp");
			                    
			                    }
			                }
					else {
						response.sendRedirect("login.jsp");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
}
