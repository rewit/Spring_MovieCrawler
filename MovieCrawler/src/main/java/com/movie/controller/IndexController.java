package com.movie.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.domain.movie.MovieDTO;
import com.movie.service.movie.MovieService;

@Controller
public class IndexController {

	@Autowired
	MovieService mService;
	
	@RequestMapping("/")
	public String index(Model model) throws IOException{
		//1. 데이터 수집
		//2. DB에 저장
		mService.ticketRank();
		//3. DB에서 수집한 데이터 조회
		List<MovieDTO> rankList = mService.movieList();
		//4. 수집한 데이터 View단으로 전송
		model.addAttribute("rankList",rankList);
		//5. View단 이동 
		return "index";
	}
	
}
