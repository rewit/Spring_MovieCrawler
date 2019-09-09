package com.movie.persistence.member;

import com.movie.domain.member.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO mDto);
	public MemberDTO viewMember(String userid);
}

