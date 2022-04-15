package com.example.demo.dto;

public class User {
	String username,userid,userpw,userpwCheck,userphone;
	Boolean agree;
	
	
	public User(String username, String userid, String userpw, String userpwCheck, String userphone, Boolean agree) {
		super();
		this.username = username;
		this.userid = userid;
		this.userpw = userpw;
		this.userpwCheck = userpwCheck;
		this.userphone = userphone;
		this.agree = agree;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUserpwCheck() {
		return userpwCheck;
	}
	public void setUserpwCheck(String userpwCheck) {
		this.userpwCheck = userpwCheck;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public Boolean getAgree() {
		return agree;
	}
	public void setAgree(Boolean agree) {
		this.agree = agree;
	}
	
}

