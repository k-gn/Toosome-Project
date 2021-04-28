package com.web.toosome.user.reviewboard.vo;

import lombok.Data;

@Data
public class PageMaker {
	private int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수
	private int totalDataCount; // 실제 게시물 수
	private int startPage; // 현재 페이지 기준 시작 페이지 번호 
	private int endPage; // 현재 페이지 기준 끝 페이지 번호
	private boolean prev; // 이전 버튼 활성화 여부
	private boolean next; // 다음 버튼 활성화 여부
	private Criteria cri; //page(현재 페이지), perPageNum(페이지 당 보여질 게시물의 수)
	
	//생성자
	public PageMaker(Criteria cri) {
		this.cri = cri;
	}
	
	//전체 게시물의 수를 입력 받음 
	public void setTotalCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
		calcData(); 
	}
	
	//startPage, endPage, prev, next 를 계산
	public void calcData() {
		int page = this.cri.getPage();
		int perPageNum = this.cri.getPerPageNum();
		
		//예: 현재 페이지가 13이면 13/10 = 1.3 올림-> 2 끝페이지는 2*10=20
		this.endPage = (int)(Math.ceil(page/(double)displayPageCnt)*displayPageCnt);
		
        //예: 현재 페이지가 13이면 20-10 +1 = 11 
		this.startPage = (this.endPage-displayPageCnt) + 1;
		
        //실제로 사용되는 페이지의 수
        //예: 전체 게시물 수가 88개이면 88/10=8.8 올림-> 9
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum));
		
		//만약 계산된 끝 페이지 번호보다 실제 사용되는 페이지 수가 더 작으면 실제 사용될 페이지 번호만 보여줌
		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = (startPage != 1); // startPage 1이 아니면 false
		this.next = (endPage * perPageNum < totalDataCount); //아직 더 보여질 페이지가 있으면 true 
	}
}
