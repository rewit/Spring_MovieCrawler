package com.movie.persistence.movie;

import java.util.List;

import com.movie.domain.movie.MovieDTO;

public interface MovieDAO {

	public void ticketRankWrite(MovieDTO mDto);
	public List<MovieDTO> movieList(String sort);
	public void deleteAll();
	
}
