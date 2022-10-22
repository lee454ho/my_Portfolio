package com.mycompany.project.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.project.travel.model.VO;





@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public void insert(FreeBoardDTO dto) {	
		
		SqlSessionTemplate.insert("FreeBoardMapper.insert",dto);	
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return SqlSessionTemplate.selectOne("FreeBoardMapper.detail",map);	
		
	}

	@Override
	public int update(FreeBoardDTO dto) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.update("FreeBoardMapper.update",dto);
	}

	@Override
	public int delete(int free_board_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.delete("FreeBoardMapper.delete",free_board_id);
	}

	@Override
	public List<FreeBoardDTO> list() {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("FreeBoardMapper.boardlist");
	}
	
	@Override
	public List<FreeBoardDTO> listPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("FreeBoardMapper.listPaging",cri);
	}
	
	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("FreeBoardMapper.total",cri);
	}
	@Override
	public List<VO> homePaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("travelMapper.homePaging",cri);
	}
	@Override
	public int travelTotal() {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("travelMapper.travelTotal");
	}
	@Override
	public List<VO> legPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("travelMapper.legPaging",cri);
	}
	@Override
	public List<VO> earsPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("travelMapper.earsPaging",cri);
	}
	@Override
	public List<VO> eyesPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("travelMapper.eyesPaging",cri);
	}
	

	

}
