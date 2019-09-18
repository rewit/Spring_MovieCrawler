package com.movie.service.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.board.BoardDTO;
import com.movie.persistence.board.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {

   @Inject
   BoardDAO bDao;
   
   
   @Override
   public void write(BoardDTO bDto) {
      if(bDto.getBno() == 0) {
         bDao.write(bDto);   
      } else {
         bDao.update(bDto);
      }
   }

   @Override
   public void update(BoardDTO bDto) {
      // TODO Auto-generated method stub
      
   }

   @Override
   public void delete(int bno) {
      bDao.delete(bno);
      
   }

   @Override
   public BoardDTO read(int bno) {
      
      // 게시판에서 게시글 1건(상세게시글)을 조회
   
      return bDao.read(bno);
      
      
   }

   @Override
   public List<BoardDTO> listAll(HashMap<String, Object> option) {
      // 게시판에 게시글 목록을 조회
      return bDao.listAll(option);
   }

   @Override
   public int countArticle(String search_option, String keyword) {
      // 게시판 페이지네이션 작업을 위해
      // 게시글 전체 Count 수를 계산
      return bDao.countArticle(search_option, keyword);
   }

   @Override
   public void increaseCnt(int bno, HttpSession session) {
      long update_time = 0;
      if(session.getAttribute("update_time_"+bno) != null) {
         // 최근에 조회수를 올린 시간
         update_time= (long)session.getAttribute("update_time_"+bno);
      }
      // 현재 시간
      long current_time = System.currentTimeMillis();
      
      if(current_time - update_time > 24*60*60*1000) {
         // 해당 게시글의 조회수 +1
         bDao.increaseCnt(bno);
         
         // 조회수를 증가한 시간 session에 저장
         session.setAttribute("update_time_"+bno, current_time);
      }
      
   }

   

}