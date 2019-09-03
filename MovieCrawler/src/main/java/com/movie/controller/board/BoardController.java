package com.movie.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("board/*")
public class BoardController {

	@GetMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		//mav.addObject("list",list); //Model 데이터 전송
		mav.setViewName("board/list"); //View 단 jsp
		
		return mav;
	}
	
}
