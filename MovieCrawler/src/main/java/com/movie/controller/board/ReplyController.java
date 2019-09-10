package com.movie.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.domain.board.ReplyDTO;
import com.movie.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("reply/*")
public class ReplyController {

	@Inject
	private ReplyService rService;
	
	@GetMapping(value="list")
	public String listAll(int bno, Model model) {
		List<ReplyDTO> list = rService.list(bno);
		log.info("size:"+list.size());
		model.addAttribute("replyList",rService.list(bno));
		
		return "board/commentlist";
	}
}
