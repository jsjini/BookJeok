package com.yedam.order.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.serviceImpl.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class CheckBookInfoControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String odNo = req.getParameter("odNo");

		OrderService svc = new OrderServiceImpl();
		List<OrderVO> list = svc.bookInfo(Integer.parseInt(odNo));
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
