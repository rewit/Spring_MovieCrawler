package com.movie.service.movie;

import java.io.IOException;
import java.util.List;

import com.movie.domain.movie.MovieDTO;

public interface MovieService {

	//실시간 영화 순위, 영화제목, 영화포스터이미지
	//네이버 영화코드, 다음 영화코드 수집하는 코드
	
	public List<MovieDTO> ticketRank() throws IOException;
		
	public List<MovieDTO> movieList() throws IOException;

	
	
}
