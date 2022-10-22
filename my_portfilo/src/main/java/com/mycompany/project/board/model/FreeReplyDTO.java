package com.mycompany.project.board.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FreeReplyDTO {
	
	private int replyId;
	private String user_id;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date regDate;
	private String content;
	private double rating;
	private int free_board_id;
	
	public int getFree_board_id() {
		return free_board_id;
	}
	public void setFree_board_id(int free_board_id) {
		this.free_board_id = free_board_id;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	@Override
	public String toString() {
		return "FreeReplyDTO [replyId=" + replyId + ", user_id=" + user_id + ", regDate=" + regDate + ", content="
				+ content + ", rating=" + rating + ", free_board_id=" + free_board_id + "]";
	}

}
