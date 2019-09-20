package com.movie.persistence.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.movie.domain.member.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO mDto);
	public MemberDTO viewMember(String userid);
	public int idCheck(String id);
	public void write(MemberDTO mDto);
	public int pwCheck(Map<String,String> map);
	public int delete(String id);
	public int update(MemberDTO mDto);
}