package com.mycompany.project.board.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class reportBoardDTO {
	
	private int rboard_id;
	private String category;
	private String content;
	private String title;
	private String user_id;
	private Date update;
	private Date regdate;

	


	public int getRboard_id() {
		return rboard_id;
	}
	public void setRboard_id(int rboard_id) {
		this.rboard_id = rboard_id;
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
		return "FreeBoardDTO [rboard_id=" + rboard_id + ", category=" + category + ", content=" + content
				+ ", title=" + title + ", user_id=" + user_id + ", update=" + update + ", regdate=" + regdate +"]";
	}
	
	
	
	
	

}
