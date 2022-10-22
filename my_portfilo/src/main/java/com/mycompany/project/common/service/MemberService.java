package com.mycompany.project.common.service;

import java.util.List;

import com.mycompany.project.common.model.dto.MemberDTO;
import com.mycompany.project.common.model.dto.UserDTO;


public interface MemberService {

	public List<MemberDTO> userList();

	public void userPause(MemberDTO dto);

	public void userDel(MemberDTO dto);

	public MemberDTO userDetail(MemberDTO dto);

	public void pauseBatch();
	
}
