package com.movie.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.board.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void write(BoardDTO bDto) {
		sqlSession.insert("board.write",bDto);
	}

	@Override
	public void update(BoardDTO bDto) {
		sqlSession.update("board.update",bDto);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("board.delete",bno);
		
	}

	@Override
	public BoardDTO read(int bno) {
		// selectOne : 1줄
		// selectList : 여러줄
		return sqlSession.selectOne("read",bno);
	}

	@Override
	public List<BoardDTO> listAll(HashMap<String, Object> option) {
	option.put("keyword","%"+option.get("keyword")+"%");	
	
		return sqlSession.selectList("board.listAll",option);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+ keyword +"%");
		return sqlSession.selectOne("board.countArticle",map);
	}

	@Override
	public void increaseCnt(int bno) {
		sqlSession.update("board.increaseCnt",bno);
		
	}

}