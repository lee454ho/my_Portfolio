package com.mycompany.project.card.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.card.model.CardDTO;
import com.mycompany.project.card.service.CardService;


@RequestMapping("/board")
@Controller // 현재 클래스를 서버가 올라올 때 컨트롤러 bean으로 등록을 하는 것.
public class CardController {
	
	@Autowired
	CardService service;
	// Model : 자료(데이터)를 저장하는 저장소 역할
	// modelAndview : 데이터와 이동하고자 하는 viewpage를 같이 저장하는 객체(클래스)
	// 처음 create 페이지로 들어올 때에 대한 응답

	@RequestMapping(value = "/card") // url과 method 매핑 시켜 준다.(http://localhost/card)가 오면 밑에 메서드가 시작된다는 뜻.
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = service.list(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list); // (key, value)
		mv.setViewName("/card/card");
		return mv; // ModelAndView가 object 타입이니까 object를 리턴한다.
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public List<CardDTO> getList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword, @RequestParam("category_select") String category_select, Model model) throws Exception {
		CardDTO testDto= new CardDTO();
		testDto.setType(type);
		testDto.setKeyword(keyword);
		testDto.setCategory_select(category_select);
		return service.detail(testDto);
	}

}
