package com.mycompany.project.common.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.project.common.model.dao.UserDAO;
import com.mycompany.project.common.model.dto.MemberDTO;
import com.mycompany.project.common.model.dto.UserDTO;
import com.mycompany.project.common.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	UserDAO userDao;
	
	public List<MemberDTO> userList() {
		// TODO Auto-generated method stub
		return userDao.userList();
	}

	@Override
	public void userPause(MemberDTO dto) {
		userDao.userPause(dto);
	}

	@Override
	public void userDel(MemberDTO dto) {
		userDao.userDel(dto);
		
	}

	@Override
	public MemberDTO userDetail(MemberDTO dto) {
		return userDao.userDetail(dto);
	}

	@Override
	public void pauseBatch() {
		userDao.pauseBatch();
	}

}
