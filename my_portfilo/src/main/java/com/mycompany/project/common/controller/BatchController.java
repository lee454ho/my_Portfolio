package com.mycompany.project.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.mycompany.project.common.service.MemberService;

@Configuration
@EnableScheduling
public class BatchController {
	
	@Autowired
	MemberService memberService;
	
	@Scheduled(cron="0/10 * * * * *")
	public void pauseBatch() {
		memberService.pauseBatch();
	}
	
}
