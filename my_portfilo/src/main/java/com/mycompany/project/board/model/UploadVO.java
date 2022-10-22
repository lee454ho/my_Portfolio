package com.mycompany.project.board.model;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {

	private String name;
	private MultipartFile file;
	private String file_url;
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;

	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	

}
