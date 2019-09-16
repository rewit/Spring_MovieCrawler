package com.movie.service.board;

import java.beans.Transient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.board.ReplyDTO;
import com.movie.persistence.board.BoardDAO;
import com.movie.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO rDao;
	@Inject
	private BoardDAO bDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}

	@Override
	public void write(ReplyDTO rDto) {
		//댓글 등록
		rDto.write(rDto);
		
		//2. 게시글 댓글수 +1
		Map<String, Object> map = new HashMap<>();
		map.put("flag", "insert");
		map.put("bno", rDto.getBno());
		bDao.updateReplyCnt(map);
	}
	@Transient
	@Override
	public void delete(ReplyDTO rDto) {
		// 1.댓글 삭제
		rDto.delete(rDto);
		// 2. 게시글 -1
		Map<String, Object> map = new HashMap<>();
		map.put("flag", "delete");
		map.put("bno", rDto.getBno());
		bDao.updateReplyCnt(map);
	}

	
}
