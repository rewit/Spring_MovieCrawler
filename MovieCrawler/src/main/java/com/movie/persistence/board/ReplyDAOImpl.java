package com.movie.persistence.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.ReplyDTO;

import lombok.extern.slf4j.Slf4j;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.list",bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		sqlSession.insert("reply.write",rDto);
		
	}

	@Override
	public void delete(ReplyDTO rDto) {

		sqlSession.delete("reply.delete",rDto);
		
	}

	@Override
	public void updateReplyCnt(int bno, int yes) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno",bno);
		map.put("yes",yes);
		sqlSession.update("board.updateReplyCnt",map);
	}
	

}