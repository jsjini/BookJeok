package com.yedam.orderItem.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.type.BigIntegerTypeHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemVO;

public class ModifyOrderItemControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String orderitemNo = req.getParameter("itemno");
		String quantity = req.getParameter("quan");
		
		OrderItemVO vo = new OrderItemVO();
		vo.setOrderitemNo(Integer.parseInt(orderitemNo));
		vo.setQuantity(Integer.parseInt(quantity));
		
		OrderItemService svc = new OrderItemServiceImpl();
		Map<String, Object> map = new HashMap<>();

		if (svc.modOrderItem(vo)) {
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
