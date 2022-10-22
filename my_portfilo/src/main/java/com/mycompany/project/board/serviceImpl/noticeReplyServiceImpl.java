package com.mycompany.project.board.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.model.noticeBoardPageMakerDTO;
import com.mycompany.project.board.model.noticeBoardReplyPageDTO;
import com.mycompany.project.board.model.noticeCriteria;
import com.mycompany.project.board.model.noticeReplyDAO;
import com.mycompany.project.board.model.noticeReplyDTO;
import com.mycompany.project.board.service.noticeReplyService;



@Service
public class noticeReplyServiceImpl implements noticeReplyService{

	@Inject
	noticeReplyDAO replyDao;

	@Override
	public int noticeInsertReply(noticeReplyDTO dto) {
		// TODO Auto-generated method stub
		int result = replyDao.noticeInsertRply(dto);
		return result;
	}

	@Override
	public noticeBoardReplyPageDTO noticeReplyList(noticeCriteria cri) {
		noticeBoardReplyPageDTO dto = new noticeBoardReplyPageDTO();
		
		dto.setList(replyDao.noticeReplyList(cri));
		dto.setPageInfo(new noticeBoardPageMakerDTO(cri, replyDao.noticeReplyTotal(cri.getNboard_id())));
		
		return dto; 
	}

	@Override
	public int noticeDeleteReply(noticeReplyDTO dto) {
		// TODO Auto-generated method stub
		int result = replyDao.noticeDeleteReply(dto.getReplyId());
		
		return result;
	}

	@Override
	public int noticeUpdateReply(noticeReplyDTO dto) {
		// TODO Auto-generated method stub
		int result = replyDao.noticeUpdateReply(dto); 
		return result;
	}

	@Override
	public noticeReplyDTO noticeGetUpdateReply(int replyId) {
		// TODO Auto-generated method stub
		return replyDao.noticeGetUpdateReply(replyId);
	}

	

	


}
