package com.yedam.book.vo;

import lombok.Data;

@Data
public class PageDTO {
//페이징 용 
	private int currPage;
	private int totalCnt;
	private boolean prev, next; 
	private int startPage, lastPage;
	
	//생성자: 전체 건 수, 현재 페이지를 매개값으로 받음
	public PageDTO (int page, int totalCnt) {
		this.currPage = page;
		this.totalCnt = totalCnt;
		
		//이전 페이지 있는지 여부, 첫 페이지, 마지막 페이지, 이후 페이지 여부 
		//전체 건수가 : 70건 일 경우 14페이지 
		int realLast = (int)Math.ceil(totalCnt / 5.0); //전체 건 수 기준 마지막 페이지 
		this.lastPage = (int)Math.ceil(page / 5.0)*5; //현재 페이지 기준 5개 씩 보여주는 마지막페이지
		System.out.println(realLast+","+this.lastPage);
		this.startPage = this.lastPage -4;
		this.lastPage = this.lastPage > realLast ? realLast : this.lastPage;
		
		this.prev = this.startPage > 1; 
		this.next = this.lastPage < realLast; 
	}

	@Override
	public String toString() {
		return "PageDTO [currPage=" + currPage + ", totalCnt=" + totalCnt + ", prev=" + prev + ", next=" + next
				+ ", startPage=" + startPage + ", lastPage=" + lastPage + "]";
	}
	
}
