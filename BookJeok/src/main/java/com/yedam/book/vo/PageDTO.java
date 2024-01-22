package com.yedam.book.vo;

import lombok.Data;

@Data
public class PageDTO {
//페이징 용 
	private int currPage; //현재 페이지 
	private int totalCnt; //전체 게시물 수 
	private boolean prev, next; //이전 페이지, 다음 페이지 존재유무
	private int startPage, lastPage; //시작 페이지, 끝 페이지 
	private int pageUnit = 12; //한 페이지 출력할 상품 수 
	private int pageSize = 5; //한 페이지 출력할 페이지 번호 갯수 
	
	//생성자: 전체 건 수, 현재 페이지를 매개값으로 받음
	public PageDTO (int page, int totalCnt) {
		this.currPage = page;
		this.totalCnt = totalCnt;
	
		
		//이전 페이지 있는지 여부, 첫 페이지, 마지막 페이지, 이후 페이지 여부 
		//전체 건수가 : 70건 일 경우 14페이지 
		int realLast = (int)Math.ceil(totalCnt / (double)pageUnit); //전체 건 수 기준 마지막 페이지 
		this.lastPage = (int)Math.ceil(page / (double)pageSize)*pageSize; //현재 페이지 기준 5개 씩 보여주는 마지막페이지
		System.out.println(realLast+","+this.lastPage);
		this.lastPage = this.lastPage > realLast ? realLast : this.lastPage;
		this.startPage = this.lastPage -pageSize+1;
		if(this.startPage <1) {
			this.startPage = 1;
		}
		
		this.prev = this.startPage > 1; 
		this.next = this.lastPage < realLast; 
	}

	
}
