package com.movie.domain.board;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class ReplyDTO {

	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	private int bno;
	
	
	public void delete(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		
	}


	public void write(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		
	}
}
