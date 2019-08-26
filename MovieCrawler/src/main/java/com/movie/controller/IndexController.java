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
		
		List<MovieDTO> rankList = mService.ticketRank();
		model.addAttribute("rankList",rankList);
		
		return "index";
	}
	
}
