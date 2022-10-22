package com.mycompany.project.common.model.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.project.common.model.dto.MemberDTO;

public interface UserDAO{
	
	int insert(Map<String, Object> map);
	
	Map<String,Object> detail(String userid);

	int idCheck(String user_id);
	
	List<MemberDTO> userList();
	
	void userPause(MemberDTO dto);
	
	void userDel(MemberDTO dto);
	
	MemberDTO userDetail(MemberDTO dto);
	
	void pauseBatch();
	
}
