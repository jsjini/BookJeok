package com.yedam.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookService;
import com.yedam.book.serviceImpl.BookServiceImpl;
import com.yedam.book.vo.BookVO;

public class MainControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookList();
		List<BookVO> rlist = svc.bookRandomList();
		
		req.setAttribute("list", list);
		req.setAttribute("bookRandomList", rlist);
		// 페이지를 이동(forward)
		RequestDispatcher rd = req.getRequestDispatcher("book/bookRandomList.tiles");
		try {
			rd.forward(req, resp); // 요청을 재 지정하겠습니다.
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
