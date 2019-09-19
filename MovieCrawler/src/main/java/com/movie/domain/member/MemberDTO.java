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

    private String userid; //varchar2(60),
    private String passwd; // varchar2(60) not null,
    private String name; // varchar2(30) not null,
    private String phone; // varchar2(30) not null,
    private String email; // varchar2(50) not null,
    private String zipcode; // varchar2(200) not null,
    private String addr1; // varchar2(200) not null,
    private String addr2; // varchar2(200) not null,
    private Date regdate; // date default sysdate
}

