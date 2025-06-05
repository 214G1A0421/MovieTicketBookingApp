package com.TicketBookingApp.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.TicketBookingApp.Connection.GetConnection;
import com.TicketBookingApp.Model.upcomingInfo;

/**
 * Servlet implementation class UpComingMovies
 */
//@WebServlet("/UpComingMovies")
public class UpComingMovies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpComingMovies() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		List<upcomingInfo> list = new ArrayList<>();
        try (Connection con = new GetConnection().getConnection()) {
            String sql = "SELECT title, description, release_date, trailer_url FROM upcoming_movies";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                upcomingInfo movie = new upcomingInfo(
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("release_date"),
                    rs.getString("trailer_url")
                );
                list.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("upcomingMovies", list);
        request.getRequestDispatcher("upcoming.jsp").forward(request, response);
    }
	}


