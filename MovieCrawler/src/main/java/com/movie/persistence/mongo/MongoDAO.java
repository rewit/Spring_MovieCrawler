package com.movie.persistence.mongo;

import com.movie.domain.mongo.MovieReplyDTO;

public interface MongoDAO {
	
	public void save(MovieReplyDTO mDto);
	public void findAll(String code);
}
