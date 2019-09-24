package com.movie.controller.movie;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.service.movie.MovieService;

@Controller
@RequestMapping("movie/*")
public class MovieController {

	@Inject
	MovieService mService;
	
	@GetMapping("detail")
	public String detail(String code) {
		
		return "";
	}
}
