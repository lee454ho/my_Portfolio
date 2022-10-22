package com.mycompany.project.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;





@Repository
public class reportBoardDAOImpl implements reportBoardDAO {
	
	@Inject
	SqlSessionTemplate SqlSessionTemplate;
	
	
	
//	@Override
//	public void insert(reportBoardDTO dto) {	
//		SqlSessionTemplate.insert("reportBoardMapper.insert",dto);
//		
//	}

	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return SqlSessionTemplate.selectOne("reportBoardMapper.detail",map);	
		
	}

	@Override
	public void update(reportBoardDTO dto, UploadVO vo) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		map.put("rboard_id",dto.getRboard_id());
		map.put("category", dto.getCategory());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("user_id", dto.getUser_id());
		map.put("file", vo.getName());
		map.put("file_url",vo.getFile_url());

		SqlSessionTemplate.update("reportBoardMapper.update",map);
	}

	@Override
	public int delete(int rboard_id) {
		// TODO Auto-generated method stub

		return  SqlSessionTemplate.delete("reportBoardMapper.delete",rboard_id);
	}

	@Override
	public void insert(reportBoardDTO dto, UploadVO vo) {
		Map<String, Object> map = new HashMap<>();
		map.put("category", dto.getCategory());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("user_id", dto.getUser_id());
		map.put("file", vo.getName());
		map.put("file_url",vo.getFile_url());
		SqlSessionTemplate.insert("reportBoardMapper.insert",map);
		
	}



	@Override
	public String fileDel(int rboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("reportBoardMapper.fileDel",rboard_id);
	}



	@Override
	public String getFileName(int rboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("reportBoardMapper.getFile",rboard_id);
	}

	@Override
	public void columnDel(int rboard_id) {
		// TODO Auto-generated method stub

		SqlSessionTemplate.selectOne("reportBoardMapper.columnDel",rboard_id);
	}

	@Override
	public void content_update(reportBoardDTO dto) {
		SqlSessionTemplate.selectOne("reportBoardMapper.content_update",dto);
		
	}





}
