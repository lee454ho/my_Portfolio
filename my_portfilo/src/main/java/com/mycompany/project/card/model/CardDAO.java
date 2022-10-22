package com.mycompany.project.card.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // root-context와 연결

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		// sqlSessionTemplate.selectList <---- 결과의 집합 목록 자체가 리턴.
		// 그래서 결과 집합의 타입인 Map의 목록인 LIST로 불러와야한다.
		return this.sqlSessionTemplate.selectList("card.select_list", map);
	}

	
	 public List<CardDTO> selectDetail(CardDTO testDto)  throws Exception{ 
		 return this.sqlSessionTemplate.selectList("card.select_list", testDto); //card.select_list부분이 SQL과 일치되어야 하는 부분 ; 
		 }

	
}
