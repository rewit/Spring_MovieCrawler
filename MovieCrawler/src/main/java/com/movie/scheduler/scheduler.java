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
	
	@Scheduled(cron = "0 49 10 * * *")
	public void movieCollect() throws IOException {
		
		mService.ticketRank();
		
	}
}
