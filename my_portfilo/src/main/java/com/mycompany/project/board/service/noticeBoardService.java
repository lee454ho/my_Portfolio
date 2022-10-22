package com.mycompany.project.board.service;

import java.util.List;
import java.util.Map;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.noticeBoardDTO;

public interface noticeBoardService {
	
	void insert(noticeBoardDTO dto);
	Map<String, Object> detail(Map<String,Object> map);
	List<noticeBoardDTO> list();
	List<noticeBoardDTO> listPaging(Criteria cri);
	int total(Criteria cri);
	int delete(int nboard_id);
	String getFileName(noticeBoardDTO dto);
	String getUrl(int nboard_id);
	int update(noticeBoardDTO dto);
	void content_update(noticeBoardDTO dto);
	void AttachColumnDel(int nboard_id);
	String getFile_Name(int nboard_id);


}
