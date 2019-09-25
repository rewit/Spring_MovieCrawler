package com.movie.service.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.movie.domain.board.BoardDTO;
import com.movie.domain.board.ReplyDTO;

public interface BoardService {

	public void write(BoardDTO bDto); // 게시글 등록
	public void update(BoardDTO bDto); // 게시글 수정
	public void delete(int bno); // 게시글 삭제
	public BoardDTO read(int bno); // 상세게시글(1건)
	public void increaseCnt(int bno, HttpSession session); // 조회수 증가 처리

	// 게시글 조회시 필요한 메서드(페이지네이션)
	
	public List<BoardDTO> listAll(HashMap<String, Object> option); // 게시글 목록 출력
	public int countArticle(String search_option, String keyword); // 레코드 갯수 계산
	public void answer(BoardDTO bDto); //답글 등록
}