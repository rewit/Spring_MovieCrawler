package com.movie.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.domain.board.ReplyDTO;
import com.movie.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO rDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}

	@Transactional
	@Override
	public void write(ReplyDTO rDto) {
		rDao.write(rDto);
		int yes= 1;
		rDao.updateReplyCnt(rDto.getBno(), yes);
	}

	@Transactional
	@Override
	public void delete(ReplyDTO rDto) {
		rDao.delete(rDto);
		int yes= -1;
		rDao.updateReplyCnt(rDto.getBno(), yes);
	}

	
	

}