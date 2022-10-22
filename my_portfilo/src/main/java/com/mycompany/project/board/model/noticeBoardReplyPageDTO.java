package com.mycompany.project.board.model;

import java.util.List;

public class noticeBoardReplyPageDTO {
	
	List<noticeReplyDTO> list;
	
	noticeBoardPageMakerDTO pageInfo;


	public List<noticeReplyDTO> getList() {
		return list;
	}

	public void setList(List<noticeReplyDTO> list) {
		this.list = list;
	}

	public noticeBoardPageMakerDTO getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(noticeBoardPageMakerDTO pageInfo) {
		this.pageInfo = pageInfo;
	}

	@Override
	public String toString() {
		return "noticeBoardPageMakerDTO [list=" + list + ", pageInfo=" + pageInfo + "]";
	}
	

}
