package com.movie.service.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.board.BoardDTO;
import com.movie.persistence.board.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	BoardDAO bDao;
	
	@Override
	public void writer(BoardDTO bDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BoardDTO bDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(BoardDTO bDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardDTO read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> listAll(HashMap<String, Object> option) {
		// TODO Auto-generated method stub
		return bDao.listAll(option);
	}

	@Override
	public int countArticle() {
		// TODO Auto-generated method stub
		return bDao.countArticle();
	}

}
