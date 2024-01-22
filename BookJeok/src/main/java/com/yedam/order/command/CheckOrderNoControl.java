package com.yedam.order.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.serviceImpl.OrderServiceImpl;

public class CheckOrderNoControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberNo = req.getParameter("memberNo");
		
		OrderService svc = new OrderServiceImpl();
		String odNo = svc.checkOdNo(Integer.parseInt(memberNo));
		
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(odNo));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
