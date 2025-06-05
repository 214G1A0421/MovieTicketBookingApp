package com.TicketBookingApp.Model;

public class getTicketInfo {
	private String name;
	private String numSeat;
	private String time;
	private String date;
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
	public getTicketInfo(String name, String numSeat, String time, String date) {
		super();
		this.name = name;
		this.numSeat = numSeat;
		this.time = time;
		this.date = date;
	}
}
