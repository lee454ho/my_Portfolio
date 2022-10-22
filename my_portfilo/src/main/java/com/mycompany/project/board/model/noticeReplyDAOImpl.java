package com.mycompany.project.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class noticeReplyDAOImpl implements noticeReplyDAO{

	@Autowired
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public int noticeInsertRply(noticeReplyDTO dto) {
		return SqlSessionTemplate.insert("noticeReply.noticeInsertReply",dto);
	}

	@Override
	public List<noticeReplyDTO> noticeReplyList(noticeCriteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("noticeReply.noticeReplyList",cri);
	}

	@Override
	public int noticeReplyTotal(int nboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeReply.noticeReplyTotal", nboard_id);
	}

	@Override
	public int noticeDeleteReply(int replyId) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.delete("noticeReply.noticeDeleteReply", replyId);
	}

	@Override
	public int noticeUpdateReply(noticeReplyDTO dto) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.update("noticeReply.noticeUpdateReply",dto);
	}

	@Override
	public noticeReplyDTO noticeGetUpdateReply(int nboard_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("noticeReply.noticeGetUpdateReply",nboard_id);
	}
	


	

}
