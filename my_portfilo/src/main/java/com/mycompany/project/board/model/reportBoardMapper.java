package com.mycompany.project.board.model;

import java.util.List;



public interface reportBoardMapper {

	
	public List<reportBoardDTO> list();
	
	public List<reportBoardDTO> listPaging(reportBoardCriteria cri);
	public int total(reportBoardCriteria cri);
//	페이징 갯수
	

}
