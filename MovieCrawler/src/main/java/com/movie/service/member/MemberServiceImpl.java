package com.movie.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.member.MemberDTO;
import com.movie.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO mDao;
	
	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
		boolean result =mDao.loginCheck(mDto); // true or false
		if(result) {
			// 로그인 성공 -> session 값을 담음
			MemberDTO one= viewMember(mDto.getUserid());
			session.setAttribute("userid", one.getUserid());
			session.setAttribute("name", one.getName());
		}
		return result;
	}

	@Override
	public void logOut(HttpSession session) {
		//로그아웃, 세션을 초기화 
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(String userid) {

		return mDao.viewMember(userid);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return mDao.idCheck(id);
	}

}

