package com.yedam.orderItem.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class OrderDetailListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String orderDetail3 = req.getParameter("orderDetail3");
		req.setAttribute("orderDetail3", orderDetail3);
		
		RequestDispatcher rd = req.getRequestDispatcher("order/orderDetailList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
