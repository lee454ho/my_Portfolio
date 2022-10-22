package com.mycompany.project.board.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.noticeBoardDAO;
import com.mycompany.project.board.model.noticeBoardDTO;
import com.mycompany.project.board.service.noticeBoardService;




@Service
public class noticeBoardServiceImpl implements noticeBoardService {
	
	@Autowired
	noticeBoardDAO boardDAO;
	
	@Override
	public void insert(noticeBoardDTO dto) {
		boardDAO.insert(dto);	
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}
	
	@Override
	public int delete(int nboard_id) {
		return boardDAO.delete(nboard_id);
	}
	@Override
	public List<noticeBoardDTO> list() {
		// TODO Auto-generated method stub
		return boardDAO.list();
	}
	@Override
	public List<noticeBoardDTO> listPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.listPaging(cri);
	}
	@Override
	public int total(Criteria cri) {
		return boardDAO.total(cri);
	}

	@Override
	public String getFileName(noticeBoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.getFileName(dto);
	}
	@Override
	public String getUrl(int nboard_id) {
		// TODO Auto-generated method stub
		return boardDAO.getFileUrl(nboard_id);
	}

	@Override
	public int update(noticeBoardDTO dto) {
		return boardDAO.update(dto);
	}
	@Override
	public void content_update(noticeBoardDTO dto) {
		boardDAO.content_update(dto);
		
	}
	@Override
	public void AttachColumnDel(int nboard_id) {
		boardDAO.AttachColumnDel(nboard_id);
		
	}
	@Override
	public String getFile_Name(int nboard_id) {
		// TODO Auto-generated method stub
		return boardDAO.getFile_Name(nboard_id);
	}

}
