package com.movie.domain.member;

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
public class MemberDTO {

	private String userid;
	private String passwd;
	private String name;
	private int phone;
	private String email;
	private int zipcode;
	private String addr1;
	private String addr2;
	private Date join_date;
}