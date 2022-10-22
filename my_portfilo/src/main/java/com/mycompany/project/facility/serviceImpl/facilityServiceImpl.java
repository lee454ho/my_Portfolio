package com.mycompany.project.facility.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycompany.project.facility.model.facilityDAO;

import com.mycompany.project.facility.service.facilityService;



@Service
public class facilityServiceImpl implements facilityService{
	@Autowired
facilityDAO testDao;

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return this.testDao.selectList(map);
		
	}

	@Override
	public List<Map<String, Object>> restroom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.testDao.selectList(map);
	}

}

