package com.mycompany.project.board.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class noticeBoardDTO {
	
	private int nboard_id;
	private String category;
	private String content;
	private String title;
	private String user_id;
	private Date update;
	private Date regdate;
	private String file_name;
	private String file_url;
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}	
	
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getNboard_id() {
		return nboard_id;
	}
	public void setNboard_id(int nboard_id) {
		this.nboard_id = nboard_id;
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
		return "FreeBoardDTO [nboard_id=" + nboard_id + ", category=" + category + ", content=" + content
				+ ", title=" + title + ", user_id=" + user_id + ", update=" + update + ", regdate=" + regdate + "]";
	}
	
	
	
	
	

}
