package com.movie.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.list",bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("reply.write",rDto);
		
	}

	@Override
	public void delete(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		sqlSession.delete("reply.delete",rDto);
	}
}
