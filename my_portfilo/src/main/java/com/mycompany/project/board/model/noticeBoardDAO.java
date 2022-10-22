package com.mycompany.project.board.model;

import java.util.List;
import java.util.Map;

public interface noticeBoardDAO {
	
	//insert update delete 
	void insert(noticeBoardDTO dto);
	Map<String,Object> detail(Map<String,Object> map);
	int delete(int nboard_id);
	public List<noticeBoardDTO> list();
	public int total(Criteria cri);
	List<noticeBoardDTO> listPaging(Criteria cri);
	String getFileName(noticeBoardDTO dto);
	String getFileUrl(int nboard_id);
	int update(noticeBoardDTO dto);
	void content_update(noticeBoardDTO dto);
	void AttachColumnDel(int nboard_id);
	String getFile_Name(int nboard_id);

}
