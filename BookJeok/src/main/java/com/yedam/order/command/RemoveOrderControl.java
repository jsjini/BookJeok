package com.yedam.order.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.serviceImpl.OrderServiceImpl;

public class RemoveOrderControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String odNo = req.getParameter("orderNo");

		OrderService svc = new OrderServiceImpl();
		Map<String, Object> map = new HashMap<>();
		if (svc.remOrder(Integer.parseInt(odNo))) {
			map.put("retCode", "OK");
			map.put("retCode1", "OK");
			map.put("retCode2", "OK");
			map.put("retCode3", "OK");
			map.put("retCode4", "OK");
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
