package com.movie.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@PostMapping(value = "logout")
	@ResponseBody
	public void logout(HttpSession session) {
		mService.logOut(session);
	}
	
	@GetMapping(value = "write")
	public String write() {
		return "member/write";
	}
	
	@PostMapping(value = "write")
	public String write(MemberDTO mDto) {
		
		mService.write(mDto);
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping(value = "idCheck")
	public int idCheck(String id) {
		log.info("AJAX ID 중복체크 : " +id);
		return mService.idCheck(id);
	}
	
	//회원탈퇴 View
	@GetMapping("delete")
	public String delete() {
		return "member/delete";
	}
	
	//회원탈퇴 Action
	@PostMapping("delete")
	public String delete(String id,HttpSession session) {
		
		mService.delete(id, session);
		
		return"redirect:/";
	}
	//회원 수정View
	@GetMapping("update")
	public String update(Model model,HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		
		if(userid == null) {
			return "redirect:/";
		}else {
			model.addAttribute("one",mService.viewMember(userid));
			return "member/write";
		}
	}
	
	//현재 비밀번호 체크(회원탈퇴용) - AJAX
	@ResponseBody
	@PostMapping("pwcheck")
	public int pwCheck(String id,String pw) {
		Map<String,String> map = new HashMap<>();
		map.put("id",id);
		map.put("pw",pw);
		return mService.pwCheck(map);
	}
	
	@PostMapping("update")
	public String update(MemberDTO mDto,HttpSession session) {
		//log.info(mDto.toString());
		mService.update(mDto, session);
		return "redirect:/";
	}
}