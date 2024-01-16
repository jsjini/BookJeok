package com.yedam.review.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class ReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bookNo = req.getParameter("bookNo");
		
		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> reviewInfo = svc.selectOne(Integer.parseInt(bookNo));
		
		req.setAttribute("reviewVO", reviewInfo);
		
		RequestDispatcher rd = req.getRequestDispatcher("book/bookInfo.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
