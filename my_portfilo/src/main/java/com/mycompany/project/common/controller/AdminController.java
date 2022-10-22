package com.mycompany.project.common.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project.common.model.dto.MemberDTO;
import com.mycompany.project.common.service.MemberService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	  
	@Inject
	MemberService service;
	
	@RequestMapping("/main")
	public String main(Model model) {
		model.addAttribute("userList", service.userList());
		return "/admin/main";
	}
	
	@RequestMapping("/userDetail")
	public String userDetail(Model model, MemberDTO dto) {
		model.addAttribute("user", service.userDetail(dto));
		return "/admin/userDetail";
	}
	
	

	@RequestMapping(value="/pause", method=RequestMethod.POST)
	public String pause(MemberDTO dto) {
		service.userPause(dto);
		
		return "redirect:/admin/main";
	}
	@RequestMapping(value="/userDel", method=RequestMethod.POST)
	public String userDel(MemberDTO dto) {
		service.userDel(dto);
		
		return "redirect:/admin/main";
	}
	
	
}
