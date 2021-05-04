package com.web.toosome.user.board.vo;

import lombok.Data;


@Data
public class BoardSearchVO {
	
	private String condition; //제목 선택시 title 내용선택시 content 값을 넣어서 쏠것
	private String keyword; //검색어 입력 값
	private String startRegDate; // 시작일
	private String endRegDate; // 끝일

}
