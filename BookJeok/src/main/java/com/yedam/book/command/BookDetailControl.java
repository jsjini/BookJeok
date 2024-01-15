package com.yedam.book.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookDetailService;
import com.yedam.book.serviceImpl.BookDetailServiceImpl;
import com.yedam.book.vo.BookVO;
import com.yedam.common.Control;

public class BookDetailControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bookNo = req.getParameter("bookNo");
		
		BookDetailService svc = new BookDetailServiceImpl();
		BookVO bookInfo = svc.selectOne(Integer.parseInt(bookNo));
		
		req.setAttribute("vo", bookInfo);
		
		RequestDispatcher rd = req.getRequestDispatcher("book/bookInfo.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
