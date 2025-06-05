package com.TicketBookingApp.Model;

public class loginInfo {
private int id;
private String lusername;
public loginInfo(String lusername, String password) {
	super();
	this.id = id;
	this.lusername = lusername;
	this.password = password;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getLusername() {
	return lusername;
}
public void setLusername(String lusername) {
	this.lusername = lusername;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
private String password;
}
