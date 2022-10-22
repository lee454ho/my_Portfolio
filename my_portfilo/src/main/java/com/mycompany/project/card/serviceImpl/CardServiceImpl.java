package com.mycompany.project.card.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.card.model.CardDAO;
import com.mycompany.project.card.model.CardDTO;
import com.mycompany.project.card.service.CardService;



@Service
public class CardServiceImpl implements CardService {
	@Autowired
	CardDAO Dao;

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		
		return this.Dao.selectList(map);
	}


	@Override
	public List<CardDTO> detail(CardDTO testDto) throws Exception{
		return Dao.selectDetail(testDto);
	};

	 

}
