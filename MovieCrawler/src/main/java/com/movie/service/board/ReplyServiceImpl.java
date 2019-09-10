package com.movie.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.board.ReplyDTO;
import com.movie.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO rDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		// TODO Auto-generated method stub
	}

	@Override
	public void delete(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		
	}

}
