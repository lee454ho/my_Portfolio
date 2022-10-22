package com.mycompany.project.card.service;

import java.util.List;
import java.util.Map;

import com.mycompany.project.card.model.CardDTO;



public interface CardService {

	List<Map<String, Object>> list(Map<String, Object> map);

	List<CardDTO> detail(CardDTO testDto) throws Exception;

}
