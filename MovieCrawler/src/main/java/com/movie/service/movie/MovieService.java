package com.movie.service.movie;

import java.io.IOException;
import java.util.List;

import com.movie.domain.movie.MovieDTO;

public interface MovieService {

	public List<MovieDTO> ticketRank() throws IOException;
		
	public List<MovieDTO> movieList(String sort) throws IOException;
}
