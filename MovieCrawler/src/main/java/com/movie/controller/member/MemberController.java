package com.movie.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PostMapping("logout")
	@ResponseBody
	public void logout(HttpSession session) {
		mService.logOut(session);
	}
	
	@GetMapping("write")
	public String write() {
		return "member/write";
	}
	@ResponseBody
	@PostMapping("idCheck")
	public int idCheck(String id) {
		log.info("AJAX ID 중복체크:"+id);
		return mService.idCheck(id);
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberDTO memberDto) {
		
		return "member/join";
	}
	
	
	
	
	
	
	
	
}
