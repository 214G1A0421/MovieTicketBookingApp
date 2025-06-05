package com.TicketBookingApp.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetConnection {
	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/mbt";
		String username = "root";
		String password = "admin@123";
		Connection con = null;
		ResultSet res=null;
		Statement stmt=null;
		String query="select * from register";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Loaded and registered the Driver");
			con = DriverManager.getConnection(url,username,password);
			System.out.println("Connection Established");
			stmt=con.createStatement();
			res=stmt.executeQuery(query);
			while(res.next()) {
				System.out.println(res.getInt("id")+" "+res.getString("name")+" "+res.getString("dob")+" "+res.getString("email")+" "+res.getString("password"));
			}

			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		return con;
	}

}
