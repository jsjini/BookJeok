package com.yedam.orderItem.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemPageVO;

public class CheckReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");

		String bookNo = req.getParameter("bookNo1");
		String orderitemNo = req.getParameter("orderitemNo");
		String memberNo = req.getParameter("memberNo");
		System.out.println(bookNo);
		OrderItemService svc = new OrderItemServiceImpl();
		OrderItemPageVO vo = svc.checkReview(Integer.parseInt(bookNo), Integer.parseInt(orderitemNo),
				Integer.parseInt(memberNo));

		Gson gson = new GsonBuilder().create();
//		if (vo != null) {
			try {
				resp.getWriter().print(gson.toJson(vo));
			} catch (IOException e) {
				e.printStackTrace();
			}
//		} 
	}

}
