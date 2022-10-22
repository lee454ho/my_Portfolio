package com.mycompany.project.board.model;

import java.util.List;

public class FreeReplyPageDTO {
	
	List<FreeReplyDTO> list;
	
	PageMakerDTO pageInfo;


	public List<FreeReplyDTO> getList() {
		return list;
	}

	public void setList(List<FreeReplyDTO> list) {
		this.list = list;
	}

	public PageMakerDTO getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageMakerDTO pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	@Override
	public String toString() {
		return "FreeReplyPageDTO [list=" + list + ", pageInfo=" + pageInfo + "]";
	}
}
