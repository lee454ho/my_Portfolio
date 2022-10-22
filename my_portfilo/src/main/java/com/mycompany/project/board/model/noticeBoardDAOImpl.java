package com.mycompany.project.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class noticeBoardDAOImpl implements noticeBoardDAO {
	
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public void insert(noticeBoardDTO dto) {
		SqlSessionTemplate.insert("noticeBoardMapper.insert",dto);
		
	}

	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return SqlSessionTemplate.selectOne("noticeBoardMapper.detail",map);	
		
	}

	@Override
	public int delete(int nboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.delete("noticeBoardMapper.delete",nboard_id);
	}

	@Override
	public List<noticeBoardDTO> list() {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("noticeBoardMapper.boardlist");
	}
	
	@Override
	public List<noticeBoardDTO> listPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("noticeBoardMapper.listPaging",cri);
	}
	
	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeBoardMapper.total",cri);
	}

	@Override
	public String getFileName(noticeBoardDTO dto) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeBoardMapper.getFileName",dto);
	}

	@Override
	public String getFileUrl(int nboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeBoardMapper.getFileUrl",nboard_id);
	}

	@Override
	public int update(noticeBoardDTO dto) {
		return SqlSessionTemplate.update("noticeBoardMapper.update",dto);
		
	}

	@Override
	public void content_update(noticeBoardDTO dto) {
		SqlSessionTemplate.update("noticeBoardMapper.content_update",dto);
		
	}

	@Override
	public void AttachColumnDel(int nboard_id) {
		SqlSessionTemplate.selectOne("noticeBoardMapper.AttachColumnDel",nboard_id);
		
	}

	@Override
	public String getFile_Name(int nboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeBoardMapper.getFile_Name",nboard_id);
	}


}
