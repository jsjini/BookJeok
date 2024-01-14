package com.yedam.common;

import java.util.List;

import com.yedam.book.service.BookService;
import com.yedam.book.serviceImpl.BookServiceImpl;
import com.yedam.book.vo.BookVO;

public class Mainexe { // 테스트용 클래스
	public static void main(String[] args) {
		
		
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookList();
		System.out.println(list.toString());
		
		
		
		// 검색관련 테스트
		/*
		SearchService svc = new SearchServiceImpl();
		List<SearchVO> list = svc.searchList("24/01/14");
		System.out.println(list.toString());
		*/
	}

}
