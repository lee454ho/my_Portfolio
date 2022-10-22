package com.mycompany.project.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserController {


	@RequestMapping("/admin/*") // 관리자 메인 페이지
	public String admin_main() {

		return "admin/main";
	}




}