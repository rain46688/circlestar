package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String address;
	private String hobby;
	private Date enrolldate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String password, String userName, String gender, int age, String phone, String email,
			String address, String hobby, Date enrolldate) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.hobby = hobby;
		this.enrolldate = enrolldate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", gender=" + gender + ", age=" + age
				+ ", email=" + email + ", address=" + address + ", hobby=" + hobby + "]";
	}
	
	
	
	
	
	
}
