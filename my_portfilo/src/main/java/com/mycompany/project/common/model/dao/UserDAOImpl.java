package com.mycompany.project.common.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.project.common.model.dto.MemberDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("user.insert", map);
	}

	@Override
	public Map<String, Object> detail(String userid) {
		return sqlSession.selectOne("user.detail", userid);
	}

	@Override
	public int idCheck(String user_id) {
		return sqlSession.selectOne("user.idCheck",user_id);
	}
	
	@Override
	 public List<MemberDTO> userList() {
	 	// TODO Auto-generated method stub
	 	return sqlSession.selectList("user.userList");
	 }
	
	@Override
	 public void userPause(MemberDTO dto) {
	 	sqlSession.update("user.userPause",dto);
	 }
	
	 @Override
	 public void userDel(MemberDTO dto) {
	 	sqlSession.update("user.userDel",dto);
	 	
	 }
	
	 @Override
	 public MemberDTO userDetail(MemberDTO dto) {
	 	return sqlSession.selectOne("user.userDetail", dto);
	 }
	
	 @Override
	 public void pauseBatch() {
	 	sqlSession.update("user.pauseBatch");
	 }
}
