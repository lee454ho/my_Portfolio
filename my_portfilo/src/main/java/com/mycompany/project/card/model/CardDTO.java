package com.mycompany.project.card.model;

public class CardDTO {
	private int store_num;
	private String category;
	private String store_name;
	private String address_rd;
	private String address_lm;
	private String phone;
	
	// 검색필터
	private String type; // 검색 지역
	private String keyword; //검색 내용
	private String category_select; // 업종
	
	public int getStore_num() { 
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getAddress_rd() {
		return address_rd;
	}
	public void setAddress_rd(String address_rd) {
		this.address_rd = address_rd;
	}
	public String getAddress_lm() {
		return address_lm;
	}
	public void setAddress_lm(String address_lm) {
		this.address_lm = address_lm;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public String getCategory_select() {
		return category_select;
	}
	public void setCategory_select(String category_select) {
		this.category_select = category_select;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	

}
