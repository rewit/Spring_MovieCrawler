package com.movie.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{

	//메인액션 실행 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//session 체크, 값이 있으면 통과
		//없으면 돌려보냄(원 페이지로 복귀 후 모달창, 경고메세지 출력)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userid") == null) {
			log.info(">>로그인 해주세요");
			String referer = request.getHeader("referer");
			String uri = request.getRequestURI();
			int index = referer.lastIndexOf("/");
			int length = referer.length();
			String url = referer.substring(index, length);
			//로그인페이지로 이동
			//FlashMap은 1회성 데이터
			FlashMap flashMap = new FlashMap();
			flashMap.put("message", "nologin");
			//게시글 등록->로그인체크->null->원페이지 이동->
			//모달창 로그인 -> 로그인 성공 -> 게시글 등록페이지 이동
			flashMap.put("uri",uri);//로그인후 이동할 페이지 주소
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flashMap, request, response);
			response.sendRedirect(referer);

//			log.info("referer:" + referer);
//			log.info("index:"+index);
//			log.info("length:"+length);
//			log.info("uri:"+uri);
			
			if(url.equals("save")) {
				response.sendRedirect(request.getContextPath()+"/board/list");
				return false;
			}
			
			return false;//못들어감, 원페이지 복귀
		}else {
			log.info("통과");
			return true;//통과
		}
	}
	//메인액션 실행 후 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
