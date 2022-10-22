package com.mycompany.project.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.noticeBoardReplyPageDTO;
import com.mycompany.project.board.model.noticeCriteria;
import com.mycompany.project.board.model.noticeReplyDTO;
import com.mycompany.project.board.service.noticeReplyService;


@RequestMapping("/board")
@Controller
public class noticeBoardReplyController {
	@Autowired
	noticeReplyService replyService;
	
	@ResponseBody
	@RequestMapping(value = "/noticeReplyInsert", method = RequestMethod.POST)
	public void replyInsert(noticeReplyDTO dto) {
		replyService.noticeInsertReply(dto);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/noticeReplyList", method = RequestMethod.GET)
	public noticeBoardReplyPageDTO replyList(noticeCriteria cri) {
		
		return  replyService.noticeReplyList(cri);
		
		
	}
	@ResponseBody
	@RequestMapping(value = "/noticeReplyDelete", method = RequestMethod.POST)
	public void replyDelete(noticeReplyDTO dto) {
		
		 replyService.noticeDeleteReply(dto);
		 
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/noticeReplyUpdate", method = RequestMethod.GET)
	public void replyUpdateGet(noticeReplyDTO dto,Model model) {
		
		replyService.noticeUpdateReply(dto);
		
	}		
		
	
}
