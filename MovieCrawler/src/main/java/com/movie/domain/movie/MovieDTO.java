package com.movie.domain.movie;

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
	private String imgsrc;  	// 포스터 이미지
	private String type; 		// 영화장르
	private String opendate;	// 개봉일
	private String bookingrate; // 예매율
	private String runtime;		// 상영시간
	private String director;	// 감독
	private String actor;		// 출연자
	private String navercode; 	// 네이버 영화코드
	private double naverscore;	// 네이버 평점
	private String daumcode; 	// 다음 영화코드
	private double daumscore;	// 다음 평점
	
	
	
} 
