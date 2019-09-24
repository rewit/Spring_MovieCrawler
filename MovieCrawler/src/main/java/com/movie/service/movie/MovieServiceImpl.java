package com.movie.service.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.domain.mongo.MovieReplyDTO;
import com.movie.domain.movie.MovieDTO;
import com.movie.persistence.mongo.MongoDAO;
import com.movie.persistence.movie.MovieDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class MovieServiceImpl implements MovieService {

   @Inject
   MovieDAO mDao;
   @Inject
   MongoDAO mongoDao;
   
   @Override
   @Transactional
   public List<MovieDTO> ticketRank() throws IOException {
      // 비즈니스로직 : 네이버, 다음 영화정보 크롤링 및 DB에 저장
      
      List<MovieDTO> rankList = new ArrayList<>();

      String naverRankUrl = "https://movie.naver.com/movie/running/current.nhn?order=reserve";
      String daumRankUrl = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx";

      // 네이버 영화 실시간 예매 순위 1~10위까지 수집
      Document naverDoc = Jsoup.connect(naverRankUrl).get();
      Elements naverList = naverDoc.select("dt.tit a");
      Elements naverImg = naverDoc.select("div.thumb a img");
      Elements scoreList = naverDoc.select("dl.lst_dsc");

      // 다음 영화 실시간 예매 순의 1위 ~ 10위까지 수집 및 추출
      Document daumDoc = Jsoup.connect(daumRankUrl).get();
      Elements daumMovie = daumDoc.select(".tit_join a");
      
      // DB에 있는 기존 영화정보데이터를 삭제
      mDao.deleteAll();
      
      
      // 1~10위까지 영화정보 추출
      for (int i = 0; i < 10; i++) {
         // 순위, 영화제목, 포스터이미지, 네이버영화코드
         int rank = i+1; // 순위
         String movie = naverList.get(i).text(); // 영화 제목
         String naverHref = naverList.get(i).attr("href");
         String naverCode = naverHref.substring(naverHref.lastIndexOf("=") + 1); // 영화 href 주소에서 Naver 고유 영화코드 추출
         String imgSrc = naverImg.get(i).attr("src"); // 포스터 이미지
         Double naverScore = Double.parseDouble(scoreList.get(i).select("span.num").first().text());
         String bookingrate = scoreList.get(i).select("span.num").last().text();
         // 다음영화코드
         String daumhref = daumMovie.get(i).attr("href");
         Document detailMovie =Jsoup.connect(daumhref).get();
         String daumHrefDeep = detailMovie.select(".wrap_pbtn a").attr("href");
         String daumCode =daumHrefDeep.substring(daumHrefDeep.lastIndexOf("=")+1);
         String daumPoint = detailMovie.select(".subject_movie em.emph_grade").text();
         double daumScore=0.0;
         if(!daumPoint.isEmpty()) {
            daumScore = Double.parseDouble(daumPoint);
         }
         
         Elements info1 = detailMovie.select("dd.txt_main");
         String type = info1.get(0).text();
         String date = info1.get(1).text();
         String openDate = date.substring(0, date.indexOf("개봉")-1);
         String info3 = info1.get(1).nextElementSibling().text();
         String time = info3.substring(0, info3.indexOf(","));
         String runTime = time.substring(0, time.lastIndexOf("분"));
         Elements info2 = detailMovie.select("dd.type_ellipsis");
         String director = info2.get(0).select("a").text();
         String actor = info2.get(1).select("a").text();
         
         MovieDTO mDto = new MovieDTO(rank, movie, imgSrc, type, openDate, bookingrate, runTime, director, actor, naverCode, naverScore, daumCode, daumScore);
         rankList.add(mDto);
         
         // DB에서 실시간영화예매순위 1~10위까지의 데이터를 저장
         mDao.ticketRankWrite(mDto);
      }
//      for (MovieDTO movie : rankList) {
//         System.out.println(movie.toString());
//      }
      
   
      
      return rankList;
   }

   @Override
   public List<MovieDTO> movieList(String sort) {
      
      // DB에 저장되어 있는 실시간영화예매순위 정보를 
      // 가져와서 View단으로 전송
      
      return mDao.movieList(sort);
   }

   @Override
   public void replyMovie() throws IOException {
      List<MovieDTO> list= mDao.getMovieCode();
//      for (MovieDTO movieDTO : list) {
//         log.info(movieDTO.getMovie()+", "+movieDTO.getDaumcode());
//      }
      
      replyCrawler(list.get(2).getMovie(),list.get(2).getDaumcode());
   }

   @Override
   public void replyCrawler(String movie, String code) throws IOException {
      String base = "";
      int page = 1;
      String url = "";
      int count = 0;
      String compare = "";

         base ="https://movie.daum.net/moviedb/grade?movieId="+code+"&type=netizen&page=";
         url = base + page;
         while (true) {
            Document doc = Jsoup.connect(url).get();
            Elements reply = doc.select("div.review_info");

            if(reply.isEmpty()) {
               break;
            }
            for (Element element : reply) {
               String date = element.select("div.review_info > div.append_review > span").text();
               String writer = element.select("div.review_info > a > em").text();
               String score = element.select("div.raking_grade > em").text();
               String content = element.select("div.review_info > p").text();

                 int numScore = Integer.parseInt(score);
               
                 count++;

               System.out.println("-----------------------------" + count + "-----------------------------");
               System.out.println("작성일자 :" + date);
               System.out.println("작성자 :" + writer);
               System.out.println("내용 : " + content);
               System.out.println("평점 : " + score);
               MovieReplyDTO mDto= new MovieReplyDTO(code,movie,score,content,writer,date);
               mongoDao.save(mDto);
            }

             System.out.println("-------------------------------------------------------------");
                page= page+1;
                url = base + page;
         }
      }

@Override
public void detail(String code) {
	mongoDao.findAll(code);
}

   

   
}