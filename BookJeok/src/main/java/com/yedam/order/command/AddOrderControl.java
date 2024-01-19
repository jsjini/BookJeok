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
import com.yedam.order.vo.OrderVO;

public class AddOrderControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String odNo = req.getParameter("odNo");
		String bookNo = req.getParameter("bookNo");
		String quantity = req.getParameter("quantity");
		
		OrderVO vo = new OrderVO();
		vo.setMemberNo(Integer.parseInt(odNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setQuantity(Integer.parseInt(quantity));
		
		OrderService svc = new OrderServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		if(svc.addOrder(vo) == 1) {
			map.put("retCode", "OK");
		} else if (svc.addOrderItem(vo) == 2){
			map.put("retCode", "CK");
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
