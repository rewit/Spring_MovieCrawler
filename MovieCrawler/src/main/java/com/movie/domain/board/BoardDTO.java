package com.movie.domain.board;

import java.util.Date;

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
public class BoardDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private Date regdate;
	//게시글 답글
	private int ref;		//게시글 그룹
	private int re_step;	//그룹내 정렬(출력) 순서
	private int re_level;	//답글 level ex) RE: / RE: RE:
}