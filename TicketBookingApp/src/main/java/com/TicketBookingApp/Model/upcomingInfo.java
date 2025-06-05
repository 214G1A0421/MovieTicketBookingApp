package com.TicketBookingApp.Model;

public class upcomingInfo {
	private int id;
	private String title;
	private String description;
	private String release_date;
	private String trailer_url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getTrailer_url() {
		return trailer_url;
	}
	public void setTrailer_url(String trailer_url) {
		this.trailer_url = trailer_url;
	}
	public upcomingInfo(String title, String description, String release_date, String trailer_url) {
		super();
		this.title = title;
		this.description = description;
		this.release_date = release_date;
		this.trailer_url = trailer_url;
	}
	
}
