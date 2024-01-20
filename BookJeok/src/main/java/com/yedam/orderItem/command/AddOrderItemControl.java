package com.yedam.orderItem.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.serviceImpl.OrderItemServiceImpl;
import com.yedam.orderItem.vo.OrderItemPageVO;

public class AddOrderItemControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String odNo = req.getParameter("odNo");
		String bookNo = req.getParameter("bookNo");
		String quantity = req.getParameter("quantity");

		OrderItemPageVO vo = new OrderItemPageVO();
		vo.setOdNo(Integer.parseInt(odNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setQuantity(Integer.parseInt(quantity));

		OrderItemService svc = new OrderItemServiceImpl();

		svc.addOrderItem(vo);
	}
}
