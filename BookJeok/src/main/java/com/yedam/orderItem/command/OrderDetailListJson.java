package com.yedam.orderItem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemPageVO;

public class OrderDetailListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String odNo = req.getParameter("odNo");

		OrderItemService svc = new OrderItemServiceImpl();
		List<OrderItemPageVO> list = svc.orderItemList(Integer.parseInt(odNo));
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
