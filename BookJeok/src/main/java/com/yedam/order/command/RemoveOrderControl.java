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
		// 파라미터 받고
		String odNo = req.getParameter("orderNo");

		//서비스 호출
		OrderService svc = new OrderServiceImpl();
		boolean result = svc.remOrder(Integer.parseInt(odNo));
		
		
		//결과 저장
		Map<String, Object> map = new HashMap<>();
		if (result) {
			map.put("retCode", "OK");
//			map.put("retCode1", "OK");
//			map.put("retCode2", "OK");
//			map.put("retCode3", "OK");
//			map.put("retCode4", "OK");
		} else {
			map.put("retCode", "NG");
		}

		// 결과 전송
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
