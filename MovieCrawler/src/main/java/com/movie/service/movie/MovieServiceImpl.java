package com.movie.service.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.domain.movie.MovieDTO;
import com.movie.persistence.movie.MovieDAO;

@Service
public class MovieServiceImpl implements MovieService{

	@Inject
	MovieDAO mDao;
	
	@Override
	@Transactional
	public List<MovieDTO> ticketRank() throws IOException {
		// 비즈니스로직: 네이버, 다음 영화정보 크롤링 및 DB에 저장
		
		//1~20위까지 영화제목과 네이버, 다음 영화코드값을 저장하는 리스트
		List<MovieDTO> rankList = new ArrayList<>();
		String naverRankUrl  ="https://movie.naver.com/movie/running/current.nhn";
		String daumRankUrl = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx";

		//Naver 영화 실시간 예매순위 1~20위 수집
		Document naverDoc = Jsoup.connect(naverRankUrl).get();
		Elements naverList = naverDoc.select("dt.tit a");
		Elements naverImg = naverDoc.select("div.thumb a img");
		Elements scoreList = naverDoc.select("dl.lst_dsc");
		
		//다음 영화 실시간 예매순위 1~20위 수집
		Document daumDoc = Jsoup.connect(daumRankUrl).get();
		Elements daumList = daumDoc.select(".tit_join a");
		
		//DB에 있는 기존 영화정보 데이터를 삭제
		mDao.deleteAll();
		
		//1 ~ 20위까지 영화제목 추출
		for (int i = 0; i < 10; i++) {
			//순위, 영화제목, 포스터이미지, 네이버영화코드
			int rank = i+1;//순위
			String movie = naverList.get(i).text(); //영화 제목
			String naverHref = naverList.get(i).attr("href");
			//영화 href 주소에서 네이버 고유 영화code값 추출 
			String navercode = naverHref.substring(naverHref.lastIndexOf("=")+1);
			String imgsrc = naverImg.get(i).attr("src"); //포스터 이미지
			Double naverscore = Double.parseDouble(scoreList.get(i).select("span.num").first().text());
			String bookingrate = scoreList.get(i).select("span.num").last().text();
			
			//다음영화코드
			String daumHref = daumList.get(i).attr("href");
			Document detailMovie = Jsoup.connect(daumHref).get();
			String daumHrefDeep = detailMovie.select(".wrap_pbtn a").attr("href");
			String daumcode = daumHrefDeep.substring(daumHrefDeep.lastIndexOf("=")+1);
			String daumPoint = detailMovie.select(".subject_movie em.emph_grade").text();
			Double daumscore = 0.0;
			if(!daumPoint.isEmpty()) {
				daumscore = Double.parseDouble(daumPoint); //다음평점
			}
			
			Elements info1 = detailMovie.select("dd.txt_main");
			String type = info1.get(0).text();
			String date = info1.get(1).text();
			String opendate = date.substring(0, date.indexOf("개봉")-1);
			String info3 = info1.get(1).nextElementSibling().text();
			String time = info3.substring(0, info3.indexOf(","));
			String runtime = time.substring(0,time.lastIndexOf("분"));
			Elements info2 = detailMovie.select("dd.type_ellipsis");
			String director = info2.get(0).select("a").text();
			String actor = info2.get(1).select("a").text();
			
			MovieDTO mDto = new MovieDTO(rank, movie, imgsrc, type, opendate, bookingrate, runtime, director, actor, navercode, naverscore, daumcode, daumscore);
			rankList.add(mDto);
			
			// DB에 실시간 영화예매순위 1~10위까지의 데이터를 저장
			mDao.ticketRankWrite(mDto);
			
			//Transactional Test
			//삭제는 성공하고 등록에 실패했을때
			//DB에 데이터가 삭제되지 않음 
			//MovieDTO mDto2 = new MovieDTO();
			//mDao.ticketRankWrite(mDto2);

		}
//		for (MovieDTO movie : rankList) {
//			System.out.println(movie.toString());
//		}
		
		
		return rankList;
	}

	@Override
	public List<MovieDTO> movieList() throws IOException {
		//DB에 저장되어 있는 실시간 영화예매순위 정보를 가져와서 View단으로 전송
		List<MovieDTO> rankList = mDao.movieList();
		
		return rankList;
	}

}
