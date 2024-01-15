package com.yedam.book.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookService;
import com.yedam.book.serviceImpl.BookServiceImpl;
import com.yedam.book.vo.BookVO;
import com.yedam.common.Control;

public class BookListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookList();
		
		req.setAttribute("list", list);
		
		// 페이지를 이동(forward)
		// 사용자가 URL을 입력시 "/WEB-INF/book/bookList.jsp"페이지 재이동
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/book/bookList.jsp");
		try {
			rd.forward(req, resp); // 요청을 재 지정하겠습니다.
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}