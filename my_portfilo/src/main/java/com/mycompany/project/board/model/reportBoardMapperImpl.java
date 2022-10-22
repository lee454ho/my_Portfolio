package com.mycompany.project.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class reportBoardMapperImpl implements reportBoardMapper {

	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Override
	public List<reportBoardDTO> list() {
		
		return sqlsession.selectList("reportBoardMapper.list");
	}

	@Override
	public List<reportBoardDTO> listPaging(reportBoardCriteria cri) {
		
		return sqlsession.selectList("reportBoardMapper.listPaging", cri);
	}

	@Override
	public int total(reportBoardCriteria cri) {
		
		return sqlsession.selectOne("reportBoardMapper.total",cri);
	}


}
