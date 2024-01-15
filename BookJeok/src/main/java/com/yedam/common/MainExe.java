package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.mapper.BookMapper;
import com.yedam.book.service.BookService;
import com.yedam.book.serviceImpl.BookServiceImpl;
import com.yedam.book.vo.BookVO;

public class MainExe { // 테스트용 클래스
	public static void main(String[] args) {
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookList();
		System.out.println(list.toString());
	}
}
