package com.mycompany.project.facility.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class facilityDAO {
	@Inject 
	private SqlSession sql;
	private static String namespace = "disabled";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // root-context�� ����
	
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		
		// sqlSessionTemplate.selectList <---- ����� ���� ��� ��ü�� ����.
		// �׷��� ��� ������ Ÿ���� Map�� ����� LIST�� �ҷ��;��Ѵ�.
		return this.sqlSessionTemplate.selectList("disabled.select_list", map);
	}
	public List<Map<String, Object>> selectrestroom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		// sqlSessionTemplate.selectList <---- ����� ���� ��� ��ü�� ����.
		// �׷��� ��� ������ Ÿ���� Map�� ����� LIST�� �ҷ��;��Ѵ�.
		return this.sqlSessionTemplate.selectList("disabled.select_restroom", map);
	}
}
