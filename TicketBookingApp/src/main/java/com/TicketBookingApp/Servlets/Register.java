package com.TicketBookingApp.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.RegInfo;

/**
 * Servlet implementation class Register
 */
//@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		request.setAttribute("name", name);
		request.setAttribute("dob", dob);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		
		if (checkEmailExists(email)) {
	        // Redirect with error
	        response.sendRedirect("Register.jsp?error=userexists");
	        return; // stop further execution
	    }

		RegInfo ri=new RegInfo(name,dob,email,password);
		boolean success=insertIntoRegister(ri);
		if(success) {
			response.sendRedirect("login.jsp");
		}
		else {
			response.sendRedirect("Register.jsp?error=1");
		}
		
	    
	}
		
		
		
		
	
	public static boolean insertIntoRegister(RegInfo ri) {
		Connection con = null;
		GetConnection gc = new GetConnection();
		Statement stmt = null;
//		String Password = ri.getPassword();
		String insert = "insert into Register values('"+ri.getId()+"','"+ri.getName()+"','"+ri.getDob()+"','"+ri.getEmail()+"','"+ri.getPassword()+"');";
//		System.out.println("SQL Query: " + insert);
		try {
			System.out.println("Reached insert into database");
			con = gc.getConnection();
			stmt =con.createStatement();
			int i =stmt.executeUpdate(insert);
			System.out.println("No of rows inserted: "+i);
			return i>0;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
	}
	
	private boolean checkEmailExists(String email) {
        boolean exists = false;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = new GetConnection().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT email FROM Register WHERE email = '" + email + "'");
            exists = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
        return exists;
    }

}
