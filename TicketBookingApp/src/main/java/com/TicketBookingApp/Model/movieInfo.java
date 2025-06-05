package com.TicketBookingApp.Model;

public class movieInfo {
private int id;
private String name;
private String numSeat;
private String time;
private String date;
private String movie;
public String getMovie() {
	return movie;
}
public void setMovie(String movie) {
	this.movie = movie;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNumSeat() {
	return numSeat;
}
public void setNumSeat(String numSeat) {
	this.numSeat = numSeat;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}

public movieInfo(String name, String numSeat, String time, String date, String movie) {
	super();
	this.id = id;
	this.name = name;
	this.numSeat = numSeat;
	this.time = time;
	this.date = date;
	this.movie = movie;
}


}
