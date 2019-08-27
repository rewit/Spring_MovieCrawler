package com.movie.persistence.movie;

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
	public List<MovieDTO> movieList() {
		return sqlSession.selectList("movie.list");
	}

	@Override
	public void deleteAll() {
		sqlSession.delete("movie.deleteAll");
	}

}
