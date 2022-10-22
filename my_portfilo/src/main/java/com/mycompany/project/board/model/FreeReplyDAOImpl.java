package com.mycompany.project.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeReplyDAOImpl implements FreeReplyDAO{

	@Autowired
	SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public int insertRply(FreeReplyDTO dto) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.insert("replyMapper.insertReply",dto);
	}

	@Override
	public List<FreeReplyDTO> replyList(Criteria cri) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectList("replyMapper.replyList",cri);
	}

	@Override
	public int replyTotal(int free_board_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.selectOne("replyMapper.replyTotal",free_board_id);
	}

	@Override
	public int deleteReply(int replyId) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.delete("replyMapper.deleteReply",replyId);
	}

	public FreeReplyDTO detail(int replyId) {

		return SqlSessionTemplate.selectOne("replyMapper.replyDetail",replyId);
	}
	public void updateReply(FreeReplyDTO dto) {
		
		SqlSessionTemplate.update("replyMapper.updateReply",dto);
		
	}

	

}
