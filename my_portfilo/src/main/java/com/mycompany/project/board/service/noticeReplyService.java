package com.mycompany.project.board.service;

import java.util.List;

import com.mycompany.project.board.model.noticeCriteria;
import com.mycompany.project.board.model.noticeBoardReplyPageDTO;
import com.mycompany.project.board.model.noticeReplyDTO;



public interface noticeReplyService {

	public int noticeInsertReply(noticeReplyDTO dto);
	public noticeBoardReplyPageDTO noticeReplyList(noticeCriteria cri);
	public int noticeDeleteReply(noticeReplyDTO dto);
	public int noticeUpdateReply(noticeReplyDTO dto);
	public noticeReplyDTO noticeGetUpdateReply(int nboard_id);
	
	
}
