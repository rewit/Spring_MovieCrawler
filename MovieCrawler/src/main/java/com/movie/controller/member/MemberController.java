package com.movie.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.member.MemberDTO;
import com.movie.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("member/*")
public class MemberController {

	@Inject
	MemberService mService;
	
	@PostMapping(value = "login")
	@ResponseBody
	public String login_check(MemberDTO mDto, HttpSession session) {
		boolean result = mService.login(mDto, session);
		String flag ="-1";
		if(result) {
			flag ="1";
		}
		
		return flag;
	}
	
	@PostMapping(value="logout")
	@ResponseBody
	public void logout(HttpSession session) {
		mService.logOut(session);
	}
	
}
