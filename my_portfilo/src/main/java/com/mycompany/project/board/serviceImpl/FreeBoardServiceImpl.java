package com.mycompany.project.board.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDAO;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.board.service.FreeBoardService;
import com.mycompany.project.travel.model.VO;




@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	FreeBoardDAO boardDAO;
	
	@Override
	public void insert(FreeBoardDTO dto) {
		boardDAO.insert(dto);	
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}
	@Override
	public int update(FreeBoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.update(dto);
	}
	
	@Override
	public int delete(int free_board_id) {
		return boardDAO.delete(free_board_id);
	}
	@Override
	public List<FreeBoardDTO> list() {
		// TODO Auto-generated method stub
		return boardDAO.list();
	}
	@Override
	public List<FreeBoardDTO> listPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.listPaging(cri);
	}
	@Override
	public int total(Criteria cri) {
		return boardDAO.total(cri);
	}
	
	
	
	@Override
	public List<VO> keyword(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<VO> legPaing(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.legPaging(cri);
	}
	@Override
	public List<VO> homePaing(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.homePaging(cri);
	}
	@Override
	public int travelTotal() {
		// TODO Auto-generated method stub
		return boardDAO.travelTotal();
	}
	@Override
	public List<VO> eyesPaing(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.eyesPaging(cri);
	}
	@Override
	public List<VO> earsPaing(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.earsPaging(cri);
	}


}
