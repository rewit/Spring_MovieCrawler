package com.movie.domain.movie;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MovieDTO {

	private int rank; 			// 순위
	private String movie; 		// 영화 제목
	private String imgSrc;  	// 포스터 이미지
	private String type; 		// 영화장르
	private String openDate;		// 개봉일
	private String bookingRate; // 예매율
	private String runTime;		// 상영시간
	private String director;	// 감독
	private String actor;		// 출연자
	private String naverCode; 	// 네이버 영화코드
	private double naverScore;	// 네이버 평점
	private String daumCode; 	// 다음 영화코드
	private double daumScore;	// 다음 평점
	
	
	
} 
