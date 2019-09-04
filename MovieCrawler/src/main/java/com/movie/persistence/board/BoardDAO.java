package com.movie.persistence.board;

import java.util.HashMap;
import java.util.List;

import com.movie.domain.board.BoardDTO;

public interface BoardDAO {
	
	public void writer(BoardDTO bDto); //게시글 등록
	public void update(BoardDTO bDto); //게시글 수정
	public void delete(BoardDTO bDto); //게시글 삭제
	public BoardDTO read(int bno);	   //상세게시글(1건)
	
	//게시글 조회시 필요한 메서드(페이지네이션)
	public List<BoardDTO> listAll(HashMap<String, Object> option); //게시글 목록 출력
	public int countArticle(); // 레코드 갯수 계산
}
