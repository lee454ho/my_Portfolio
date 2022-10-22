package com.mycompany.project.board.service;

import java.util.List;
import java.util.Map;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.travel.model.VO;

public interface FreeBoardService {
	
	void insert(FreeBoardDTO dto);
	int update(FreeBoardDTO dto);
	int delete(int free_board_id);
	Map<String, Object> detail(Map<String,Object> map);
	List<FreeBoardDTO> listPaging(Criteria cri);
	List<FreeBoardDTO> list();	
	int total(Criteria cri);

	
	List<VO> homePaing(Criteria cri);
	List<VO> legPaing(Criteria cri);
	List<VO> eyesPaing(Criteria cri);
	List<VO> earsPaing(Criteria cri);
	List<VO> keyword(Criteria cri);
	int travelTotal();

}
