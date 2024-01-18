package com.yedam.orderItem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemVO;

public class OrderItemPageListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
//		resp.setContentType("text/json;charset=utf-8");
		String orders = req.getParameter("orders");
//		Gson gson = new GsonBuilder().create();
		
		
//		OrderItemService svc = new OrderItemServiceImpl();
//		List<OrderItemVO> list = 
		req.setAttribute("orders", orders);
		
		RequestDispatcher rd = req.getRequestDispatcher("orderItem/orderItemList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
