package com.TicketBookingApp.Model;

public class getTicketLoginInfo {
	private String name;
	private String movie;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public getTicketLoginInfo(String name, String movie) {
		super();
		this.name = name;
		this.movie = movie;
	}
	
}
