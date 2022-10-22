package com.mycompany.project.board.service;

import java.util.List;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.FreeReplyPageDTO;



public interface FreeReplyService {
	
	public int insertReply(FreeReplyDTO dto);
	public FreeReplyPageDTO replyList(Criteria cri);
	public int deleteReply(FreeReplyDTO dto);
	void updateReply(FreeReplyDTO dto);
	FreeReplyDTO detail(int replyId);

}
