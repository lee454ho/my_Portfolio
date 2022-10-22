package com.mycompany.project.board.controller;

import org.springframework.security.core.Authentication;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.service.FreeBoardService;


@RequestMapping("/board")
@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService boardService;
	
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) {
		model.addAttribute("boardList",boardService.listPaging(cri));
		int total = boardService.total(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
		
		return "freeBoard/freeList";
	}
		
	@RequestMapping(value = "/merge/freeInsert", method = RequestMethod.GET)
		public String insert(Model model, Authentication auth) {
				
				String userid = auth.getName();
				model.addAttribute("userid", userid);
		
		return "freeBoard/freeInsert";
	}
	@RequestMapping(value = "/merge/freeInsert", method = RequestMethod.POST)
	public ModelAndView insert(FreeBoardDTO dto) {
		
		boardService.insert(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/freeList");
		
		return mv;
	}
	
	@RequestMapping(value="/freeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map, FreeBoardDTO dto, Criteria cri, Authentication auth) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("freeBoard/freeDetail");
		mv.addObject("data", boardService.detail(map));
		
		mv.addObject("loginUser", auth.getName());
		mv.addObject("auth", auth.getAuthorities());
		return mv;
	}
	
	@RequestMapping(value="/merge/freeUpdate", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> list = boardService.detail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);
		mv.setViewName("freeBoard/freeUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="/merge/freeUpdate", method = RequestMethod.POST)
	public ModelAndView update(FreeBoardDTO dto) {
		
		ModelAndView mv = new ModelAndView();
		int free_board_id = boardService.update(dto);
		mv.setViewName("redirect:/board/freeList");
		
		return mv;
	}
	@RequestMapping(value = "/merge/freeDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("free_board_id") int free_board_id ) {
		// todo : 댓글이 달려 있는 글은 댓글을 먼저 삭제하고 글을 삭제해야 함 (참조 무결성 위배로 삭제가 안됨)
		boardService.delete(free_board_id);
		
		return "redirect:/board/freeList";
	}
	

}


