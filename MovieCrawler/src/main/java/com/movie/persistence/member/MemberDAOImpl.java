package com.movie.persistence.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.member.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO mDto) {
		int count =sqlSession.selectOne("member.login",mDto);
		
		return (count == 1) ? true:false;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		
		return sqlSession.selectOne("member.viewMember",userid);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.idCheck",id);
	}

}

