package com.mycompany.project.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.board.model.UploadVO;
import com.mycompany.project.board.model.reportBoardCriteria;
import com.mycompany.project.board.model.reportBoardDTO;






public interface reportBoardService {
	void insert(reportBoardDTO dto , UploadVO vo);
//	void insert(reportBoardDTO dto);
	Map<String, Object> detail(Map<String,Object> map);
	List<reportBoardDTO> list();
	List<reportBoardDTO> listPaging(reportBoardCriteria cri);
	int total(reportBoardCriteria cri);
	void update(reportBoardDTO dto, UploadVO vo);
	int delete(int rboard_id);
	String getUrl(int rboard_id);

	String getFileName(int rboard_id);
	void columnDel(int rboard_id);
	void content_update(reportBoardDTO dto);

}
