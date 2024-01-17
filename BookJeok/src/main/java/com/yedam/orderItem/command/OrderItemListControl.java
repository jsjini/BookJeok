package com.yedam.orderItem.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class OrderItemListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		RequestDispatcher rd = req.getRequestDispatcher("orderItem/orderItemList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
