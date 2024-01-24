package com.yedam.cart.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class CartListControl implements Control {

	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		RequestDispatcher rd = req.getRequestDispatcher("cart/cartList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
