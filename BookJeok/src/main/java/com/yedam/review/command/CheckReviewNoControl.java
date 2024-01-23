package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class CheckReviewNoControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberNo = req.getParameter("memberNo");
		String bookNo = req.getParameter("bookNo1");
		String orderitemNo = req.getParameter("orderitemNo1");
		
		ReviewVO vo = new ReviewVO();
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setOrderitemNo(Integer.parseInt(orderitemNo));
		
		ReviewService svc = new ReviewServiceImpl();
		int reviewNo = svc.checkReviewNo(vo);
		
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(reviewNo));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
