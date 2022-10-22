package com.mycompany.project.board.model;

import java.util.Date;

public class FreeBoardDTO {
	
	private int free_board_id;
	private String category;
	private String content;
	private String title;
	private String user_id;
	private Date update;
	private Date regdate;
	
	
	public int getFree_board_id() {
		return free_board_id;
	}
	public void setFree_board_id(int free_board_id) {
		this.free_board_id = free_board_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "FreeBoardDTO [free_board_id=" + free_board_id + ", category=" + category + ", content=" + content
				+ ", title=" + title + ", user_id=" + user_id + ", update=" + update + ", regdate=" + regdate + "]";
	}
	
	
	
	
	

}
