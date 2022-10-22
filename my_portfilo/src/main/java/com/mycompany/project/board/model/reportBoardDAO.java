package com.mycompany.project.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;



public interface reportBoardDAO {
	
	//insert update delete 
//	void insert(reportBoardDTO dto);
	Map<String,Object> detail(Map<String,Object> map);
	void update(reportBoardDTO dto, UploadVO vo);
	int delete(int rboard_id);
	void insert(reportBoardDTO dto, UploadVO vo);
	String fileDel(int rboard_id);
	
	String getFileName(int rboard_id);
	void columnDel(int rboard_id);
	void content_update(reportBoardDTO dto);
}
