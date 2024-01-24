package com.yedam.book.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookDetailService;
import com.yedam.book.serviceImpl.BookDetailServiceImpl;
import com.yedam.book.vo.BookVO;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class BookDetailControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BookDetailService svc = new BookDetailServiceImpl();
		ReviewService rsvc = new ReviewServiceImpl();
		
		String bookNo = req.getParameter("bookNo");
		
		//도서정보 조회
		BookVO bookInfo = svc.selectOne(Integer.parseInt(bookNo));		
		//도서 리뷰 조회
		List<ReviewVO> reviewInfo = rsvc.selectOne(Integer.parseInt(bookNo));
		
		//결과 저장
		req.setAttribute("vo", bookInfo);
		req.setAttribute("reviewVO", reviewInfo);
		
		//상세페이지 이동
		RequestDispatcher rd = req.getRequestDispatcher("book/bookInfo.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
