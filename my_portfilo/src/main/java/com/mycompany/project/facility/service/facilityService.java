package com.mycompany.project.facility.service;

import java.util.List;
import java.util.Map;

public interface facilityService {

	List<Map<String, Object>> list(Map<String, Object> map);

	List<Map<String, Object>> restroom(Map<String, Object> map);

}
