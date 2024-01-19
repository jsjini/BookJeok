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
import com.yedam.orderItem.vo.OrderItemVO;

public class OrderItemListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberNo = req.getParameter("memberNo");
		
		
		OrderItemService svc = new OrderItemServiceImpl();
		OrderItemVO vo = svc.orderItemList(Integer.parseInt(memberNo));
	
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
