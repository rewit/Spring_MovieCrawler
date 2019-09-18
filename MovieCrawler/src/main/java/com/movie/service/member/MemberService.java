package com.movie.service.member;

import javax.servlet.http.HttpSession;

import com.movie.domain.member.MemberDTO;

public interface MemberService {

	// 로그인
	public boolean login(MemberDTO mDto, HttpSession session);
	// 로그아웃
	public void logOut(HttpSession session);
	// 회원가입
	// 회원수정
	// 회원삭제
	// 회원정보 1건 검색
	public MemberDTO viewMember(String userid);
	// 비밀번호 수정
	// 현재비밀번호 체크
	
	//AJAX: ID 중복 체크
	public int idCheck(String id);
}

