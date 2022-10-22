package com.mycompany.project.board.model;

import java.util.List;


public interface noticeReplyDAO {
	
	public int noticeInsertRply(noticeReplyDTO dto);
	public List<noticeReplyDTO> noticeReplyList(noticeCriteria cri);
	public int noticeReplyTotal(int replyId);
	public int noticeDeleteReply(int replyId);
	public int noticeUpdateReply(noticeReplyDTO dto);
	public noticeReplyDTO noticeGetUpdateReply(int nboard_id);
}
