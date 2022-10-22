package com.mycompany.project.board.model;

import java.util.List;
import java.util.Map;

import com.mycompany.project.travel.model.VO;



public interface FreeBoardDAO {
	
	//insert update delete 
	void insert(FreeBoardDTO dto);
	int delete(int free_board_id);
	int update(FreeBoardDTO dto);
	Map<String,Object> detail(Map<String,Object> map);
	List<FreeBoardDTO> list();
	List<FreeBoardDTO> listPaging(Criteria cri);
	int total(Criteria cri);
	
	

	List<VO> homePaging(Criteria cri);
	List<VO> legPaging(Criteria cri);
	List<VO> earsPaging(Criteria cri);
	List<VO> eyesPaging(Criteria cri);
	int travelTotal();
	
}
