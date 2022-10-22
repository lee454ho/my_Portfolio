package com.mycompany.project.facility.controller;

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

import com.mycompany.project.facility.service.facilityService;




@RequestMapping("/board")
@Controller
public class facilityController {
	
	@Autowired
	facilityService testService;
	// modelAndview : �����Ϳ� �̵��ϰ��� �ϴ� viewpage�� ���� �����ϴ� ��ü(Ŭ����)
	// ó�� create �������� ���� ���� ���� ����
	
	@RequestMapping(value= "/facilityList")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.testService.list(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);

		// ������ �帧 ���� ������ �Ʒ����� �ۼ��ص� ũ�� ������ ������.
		// �˻� Ű���� �Ķ���� �߰�
		if(map.containsKey("keyword")) {
			
			mv.addObject("keyword", map.get("keyword"));
		}
		
		mv.setViewName("facility/facility");
		return mv;
	}
	
}
	

//	@ResponseBody
//	@RequestMapping(value ="/getList" , method = RequestMethod.GET)
//	public List<Map<String, Object>>  getList() {
//		List<Map<String, Object>> detailMap = testService.detail();
//		
//	
//		return detailMap;
//	}
//
//}
