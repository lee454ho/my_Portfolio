package com.mycompany.project.board.service;


import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.board.model.UploadVO;
import com.mycompany.project.board.model.reportBoardCriteria;
import com.mycompany.project.board.model.reportBoardDAO;
import com.mycompany.project.board.model.reportBoardDTO;
import com.mycompany.project.board.model.reportBoardMapper;





@Service
public class reportBoardServiceImpl implements reportBoardService {
	
	@Autowired
	reportBoardDAO boardDAO;

	@Autowired
	reportBoardMapper mapper;

//	@Override
//	public void insert(reportBoardDTO dto) {
//		boardDAO.insert(dto);	
//	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}
	@Override
	public void update(reportBoardDTO dto,UploadVO vo) {
		// TODO Auto-generated method stub
		boardDAO.update(dto,vo);
	}
	
	@Override
	public int delete(int rboard_id) {
		return boardDAO.delete(rboard_id);
	}
	@Override
	public List<reportBoardDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}
	@Override
	public List<reportBoardDTO> listPaging(reportBoardCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.listPaging(cri);
	}
	@Override
	public int total(reportBoardCriteria cri) {
		return mapper.total(cri);
	}
	@Override
	public void insert(reportBoardDTO dto, UploadVO vo) {
		
		boardDAO.insert(dto,vo);
	}
	@Override
	public String getUrl(int rboard_id) {
		// TODO Auto-generated method stub
		return boardDAO.fileDel(rboard_id);
	}

	@Override
	public String getFileName(int rboard_id) {
		// TODO Auto-generated method stub
		return boardDAO.getFileName(rboard_id);
	}
	@Override
	public void columnDel(int rboard_id) {
		// TODO Auto-generated method stub
		boardDAO.columnDel(rboard_id);
	}
	@Override
	public void content_update(reportBoardDTO dto) {
		boardDAO.content_update(dto);
		
	}




}
