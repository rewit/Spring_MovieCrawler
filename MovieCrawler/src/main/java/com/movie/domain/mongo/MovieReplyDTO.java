package com.movie.domain.mongo;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

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
@Document(collection = "MovieReply")
public class MovieReplyDTO {

	@Id
	private String id;
	private String code; //daum 영화 code
	private String movie;
	private String score;
	private String content;
	private String writer;
	private String date;

	public MovieReplyDTO(String code, String movie, String score, String content, String writer, String date) {
		super();
		this.code = code;
		this.movie= movie;
		this.score= score;
		this.content= content;
		this.writer= writer;
		this.date= date;
	}
	
}
