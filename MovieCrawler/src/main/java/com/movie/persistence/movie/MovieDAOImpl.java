package com.movie.persistence.movie;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.movie.MovieDTO;

@Repository
public class MovieDAOImpl implements MovieDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void ticketRankWrite(MovieDTO mDto) {
		sqlSession.insert("movie.write", mDto);
	}

	@Override
	public List<MovieDTO> movieList(String sort) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sort", sort);
		return sqlSession.selectList("movie.list", map);
	}

	@Override
	public void deleteAll() {
		sqlSession.delete("movie.deleteAll");
	}

	@Override
	public List<MovieDTO> getMovieCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("movie.getMovieCode");
	}

}