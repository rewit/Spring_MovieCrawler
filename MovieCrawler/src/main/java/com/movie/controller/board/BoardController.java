package com.movie.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.domain.board.BoardDTO;
import com.movie.service.board.BoardService;
import com.movie.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/*")
public class BoardController {

	@Inject
	BoardService bService;
	
	
	@GetMapping(value = "list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword
			) {
		
		// 레코드 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start= pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록
		HashMap<String, Object> option = new HashMap<>();
		option.put("start", start);
		option.put("end", end);
		option.put("sort_option", sort_option);
		option.put("search_option", search_option);
		option.put("keyword", keyword);
		List<BoardDTO> list = bService.listAll(option);
		
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list",list); // Model 데이터 전송
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		
		mav.setViewName("board/list"); // View단 jsp
		
		return mav;
	}
	
	@GetMapping("view")
	public String view(int bno, Model model, HttpSession session) {
		// 가방
		// 값을 한개만 담고 싶다 => 변수
		// 값을 여러개해서 1줄을 담고 싶다 => DTO
		// 값을 여러 줄 담고 싶다 => List
		bService.increaseCnt(bno, session); // 조회수 증가 처리
		BoardDTO bDto = bService.read(bno); // 상세게시글 출력
		model.addAttribute("one",bDto);
		return "board/view";
	}
	
	@GetMapping("write")
	public String write(@RequestParam(defaultValue = "0") int bno, Model model) {
		if(bno != 0) { // 게시글 수정
			model.addAttribute("one",bService.read(bno));
		}
		return "board/write";
	}
	
	@PostMapping("write")
	public String write(BoardDTO bDto, HttpSession session) {
		String name =(String) session.getAttribute("name");
		bDto.setWriter(name);
		log.info(">>>>>>>>>>>>>>>>"+bDto.getBno());
		bService.write(bDto);
		return "redirect:view?bno="+bDto.getBno();
	}
	//게시글 삭제
	@GetMapping("delete")
	public String delete(int bno) {
		bService.delete(bno);
		return "redirect:list";
	}
	
	//게시글 답글 View
	@GetMapping("answer")
	public String answer(int bno,Model model) {
		model.addAttribute("one",bService.read(bno));
		model.addAttribute("flag","answer");
		return "board/write";//게시글 등록, 수정
	}
	
	//게시글 답글 Action
	@PostMapping("answer")
	public String answer(BoardDTO bDto) {
		//dDto == 제목, 내용, 작성자, 게시글번호.
		log.info("로그로그로그로그"+bDto.toString());
		//답글을 달려고 하는 메인 게시글의 정보를 
		BoardDTO pastDto = bService.read(bDto.getBno());
		
		bDto.setRef(pastDto.getRef());
		bDto.setRe_step(pastDto.getRe_step());
		bDto.setRe_level(pastDto.getRe_level());
		
		//DB에 답글 등록
		bService.answer(bDto);
		return "redirect:view?bno="+bDto.getBno();
	}
}