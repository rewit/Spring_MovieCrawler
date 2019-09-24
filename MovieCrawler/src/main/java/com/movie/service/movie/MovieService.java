package com.movie.service.movie;

import java.io.IOException;
import java.util.List;

import com.movie.domain.movie.MovieDTO;

public interface MovieService {
	//실시간 영화 순위, 영화제목,포스터이미지
	//네이버 영화코드,다음 영화코드
	public List<MovieDTO> ticketRank() throws IOException;
	//실시간 영화순위정보 조회
	public List<MovieDTO> movieList(String sort) throws IOException;
	//실시간 영화순위 (1~10위) 댓글 수집
	public void replyMovie() throws IOException;
	//영화 댓글 크롤러	
	public void replyCrawler(String movie, String code) throws IOException;
	//해당 영화 댓글을 조회(daumcode값으로)
	public void detail(String code);
}
