package com.mycompany.project.board.model;

import java.util.Arrays;
import java.util.List;

public class Criteria {
	
    private int pageNum;
    private int amount;
    private int skip;
    private String sido;
	private String keyword;
    private String type;
    private String[] typeArr;
    private int replyId;
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

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}
    
   
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
        this(1,12);
        this.skip = 0;
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip =(pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip =(pageNum-1)*this.amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", sido=" + sido
				+ ", keyword=" + keyword + ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + ", replyId="
				+ replyId + ", free_board_id=" + free_board_id + "]";
	}

	
	
    
}
