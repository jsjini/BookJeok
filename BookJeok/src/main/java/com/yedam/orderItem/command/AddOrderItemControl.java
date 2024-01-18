package com.yedam.orderItem.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemVO;

public class AddOrderItemControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String odNo = req.getParameter("odNo");
		String bookNo = req.getParameter("bookNo");
		String quantity = req.getParameter("quantity");
		
		OrderItemVO vo = new OrderItemVO();
		vo.setMemberNo(Integer.parseInt(odNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setQuantity(Integer.parseInt(quantity));
		
		OrderItemService svc = new OrderItemServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		if(svc.addOrderItem(vo) == 1) {
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
