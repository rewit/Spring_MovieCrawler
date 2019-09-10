package com.movie.persistence.board;

import java.util.List;

import com.movie.domain.board.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(int bno); //댓글 목록
	public void write(ReplyDTO rDto);	//댓글 등록
	public void delete(ReplyDTO rDto); //댓글 삭제
}
