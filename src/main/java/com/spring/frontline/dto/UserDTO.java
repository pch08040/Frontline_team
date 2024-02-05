package com.spring.frontline.dto;

public class UserDTO {
	private int userSeq = -1;
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userBirth;
	private int genderSeq = -1;
	private String userRegDate;
	private int gradeSeq = -1;
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public int getGenderSeq() {
		return genderSeq;
	}
	public void setGenderSeq(int genderSeq) {
		this.genderSeq = genderSeq;
	}
	public String getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(String userRegDate) {
		this.userRegDate = userRegDate;
	}
	public int getGradeSeq() {
		return gradeSeq;
	}
	public void setGradeSeq(int gradeSeq) {
		this.gradeSeq = gradeSeq;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userSeq=" + userSeq + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userBirth=" + userBirth + ", genderSeq="
				+ genderSeq + ", userRegDate=" + userRegDate + ", gradeSeq=" + gradeSeq + "]";
	}
	
}
