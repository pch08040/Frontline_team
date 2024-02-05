package com.spring.frontline.dto;

public class CommentDTO {
	private int commentSeq = -1;
	private String boardSeq;
	private String userSeq;
	private String parentSeq;
	private String userId;
	private String gradeSeq;
	private String commentText;
	private String commentRegDate;
	private String depth;
	
	public int getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGradeSeq() {
		return gradeSeq;
	}
	public void setGradeSeq(String gradeSeq) {
		this.gradeSeq = gradeSeq;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(String commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "CommentDTO [commentSeq=" + commentSeq + ", boardSeq=" + boardSeq + ", userSeq=" + userSeq
				+ ", parentSeq=" + parentSeq + ", userId=" + userId + ", gradeSeq=" + gradeSeq + ", commentText="
				+ commentText + ", commentRegDate=" + commentRegDate + ", depth=" + depth + "]";
	}
	
	
}
