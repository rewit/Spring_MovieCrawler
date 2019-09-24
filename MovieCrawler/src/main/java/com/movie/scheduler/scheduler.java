package com.movie.scheduler;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.movie.service.movie.MovieService;

@Component
public class scheduler {

	@Inject
	MovieService mService;
	//영화 정보 수집
	@Scheduled(cron = "0 0 12 * * *")
	public void movieCollect() throws IOException {
		
		mService.ticketRank();
		
	}
	//영화 평점 수집
	@Scheduled(cron = "0 16 10 * * *")
	public void replyCollect() throws IOException{
		mService.replyMovie();
	}
	
}