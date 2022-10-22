package com.mycompany.project.travel.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.service.FreeBoardService;
import com.mycompany.project.travel.model.VO;



@RequestMapping("/board")
@Controller
public class TravelController {

	@Autowired
	private FreeBoardService boardService;
	@Autowired
	private SqlSession sqlSesstion;
	
	@RequestMapping(value ="/travelLeg", method = RequestMethod.GET)
	public ModelAndView travelLeg(ModelAndView mv, Criteria cri) {
		
		int total = boardService.travelTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("leglist",boardService.homePaing(cri));
		mv.addObject("pageMaker",pageMake);
		mv.setViewName("travel/travelLeg");

		return mv;
		
	}
	
	
	@RequestMapping(value ="/travelEyes", method = RequestMethod.GET)
	public ModelAndView travelEye(ModelAndView mv, Criteria cri) {
		
		int total = boardService.travelTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("eyesList",boardService.homePaing(cri));
		mv.addObject("pageMaker",pageMake);
		mv.setViewName("travel/travelEyes");

		return mv;
		
	}
	@RequestMapping(value ="/travelEars", method = RequestMethod.GET)
	public ModelAndView travelEars(ModelAndView mv, Criteria cri) {
		
		int total = boardService.travelTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("earslist",boardService.homePaing(cri));
		mv.addObject("pageMaker",pageMake);
		mv.setViewName("travel/travelEars");

		return mv;
		
	}
	@RequestMapping(value ="/ajaxLegCate", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ajaxLegCate(@RequestParam(value="chkArry[]",required = false) List<String> chkArry,  HttpServletRequest request){
		HashMap<String, Object> result = new HashMap<String, Object>();
		//view에서 input 데이터를 받아와서 mapper로 보내주는 controller

		VO vo = new VO();
		String sido = request.getParameter("sido");
		String search = request.getParameter("search");
		String searchOp = request.getParameter("searchOp");
		vo.setSido(sido);
		vo.setChkArry(chkArry);
		vo.setSearch(search);
		vo.setSearchOp(searchOp);
		List<VO> list = sqlSesstion.selectList("travelMapper.legPaging",vo);
		result.put("leglist", list);
		//mapper의 결과를 result에 추가

		return result;
	}
	
	@RequestMapping(value ="/ajaxEarsCate", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ajaxEarsCate(@RequestParam(value="chkArry[]",required = false) List<String> chkArry,  HttpServletRequest request){
		HashMap<String, Object> result = new HashMap<String, Object>();

		VO vo = new VO();
		String sido = request.getParameter("sido");
		String search = request.getParameter("search");
		String searchOp = request.getParameter("searchOp");
		vo.setSido(sido);
		vo.setChkArry(chkArry);
		vo.setSearch(search);
		vo.setSearchOp(searchOp);
		List<VO> list = sqlSesstion.selectList("travelMapper.earsPaging",vo);
		result.put("earslist", list);

		return result;
	}
	
	@RequestMapping(value ="/ajaxEyesCate", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ajaxEyesCate(@RequestParam(value="chkArry[]",required = false) List<String> chkArry,  HttpServletRequest request){
		HashMap<String, Object> result = new HashMap<String, Object>();

		VO vo = new VO();
		String sido = request.getParameter("sido");
		String search = request.getParameter("search");
		String searchOp = request.getParameter("searchOp");
		vo.setSido(sido);
		vo.setChkArry(chkArry);
		vo.setSearch(search);
		vo.setSearchOp(searchOp);
		List<VO> list = sqlSesstion.selectList("travelMapper.eyesPaging",vo);
		result.put("eyesList", list);
		
		return result;
	}
	
	
	
}
