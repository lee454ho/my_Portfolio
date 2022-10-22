package com.mycompany.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.FreeReplyPageDTO;
import com.mycompany.project.board.service.FreeBoardService;
import com.mycompany.project.board.service.FreeReplyService;

@RequestMapping("/board")
@Controller
public class FreeReplyController {

		@Autowired
		FreeReplyService replyService;
		
		@ResponseBody
		@RequestMapping(value = "/merge/replyInsert", method = RequestMethod.POST)
		public void replyInsert(FreeReplyDTO dto) {

			replyService.insertReply(dto);
		}
		
		@ResponseBody
		@RequestMapping(value = "/replyList", method = RequestMethod.GET)
		public FreeReplyPageDTO replyList(Criteria cri) {
			
			return replyService.replyList(cri);
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/merge/replyDelete", method = RequestMethod.POST)
		public void replyDelete(FreeReplyDTO dto) {
			
			 replyService.deleteReply(dto);
			 
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/merge/Update", method = RequestMethod.GET)
		public void replyUpdateGet(FreeReplyDTO dto,Model model) {
			
			replyService.updateReply(dto);
			
		}	
		@ResponseBody
		@RequestMapping("/reply/detail/{replyId}")
		public ModelAndView detail(@PathVariable("replyId") int replyId, ModelAndView mv) {
			//선택 댓글의 데이터를 가져오는 controller
			FreeReplyDTO dto = replyService.detail(replyId);	
			mv.setViewName("freeBoard/freeUpdateDetail");
			mv.addObject("dto",dto);
			
			return mv;
		}
		
		@ResponseBody
		@RequestMapping("/reply/update/{replyId}")
		public ResponseEntity<String> updateRply(@PathVariable("replyId") int replyId, @RequestBody FreeReplyDTO dto){
			//댓글 수정을 업데이트 해주는 controller
			ResponseEntity<String> entity = null;
			try {
				dto.setReplyId(replyId);
				replyService.updateReply(dto);
			} catch (Exception e) {
				
			}
			return entity;
		}
}
