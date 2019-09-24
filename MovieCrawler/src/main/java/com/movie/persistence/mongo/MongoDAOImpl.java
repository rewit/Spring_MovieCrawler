package com.movie.persistence.mongo;

import java.util.List;

import javax.inject.Inject;

import org.jfree.util.Log;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.movie.domain.mongo.MovieReplyDTO;

@Repository
public class MongoDAOImpl implements MongoDAO{

	@Inject
	private MongoOperations mongoOper;
	
	@Override
	public void save(MovieReplyDTO mDto) {
		mongoOper.save(mDto);
		
	}

	@Override
	public void findAll(String code) {
//		List<MovieReplyDTO> mList = mongoOper.findAll(MovieReplyDTO.class,"MovieReply");

		Criteria cri = new Criteria("code");
		cri.is(code);
		Query query = new Query(cri);
		List<MovieReplyDTO> mList = mongoOper.find(query, MovieReplyDTO.class,"MovieReply");
		
		for(MovieReplyDTO moviereplyDTO : mList) {
			
		}
	}
	
}
