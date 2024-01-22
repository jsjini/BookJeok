package com.yedam.review.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class AddReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");

		String contents = req.getParameter("contents");
		String memberNo = req.getParameter("memberNo");
		String bookNo = req.getParameter("bookNo");
		String orderitemNo = req.getParameter("orderitemNo");

		ReviewVO vo = new ReviewVO();
		vo.setContents(contents);
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setOrderitemNo(Integer.parseInt(orderitemNo));

		ReviewService svc = new ReviewServiceImpl();
		Map<String, Object> map = new HashMap<>();

		if (svc.addReview(vo)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
