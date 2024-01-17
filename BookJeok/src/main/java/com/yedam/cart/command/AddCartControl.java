package com.yedam.cart.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.common.Control;

public class AddCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// memberNo, bookNo
		
//		CartService svc = new CartServiceImpl();
//		Map<String, Object> map = new HashMap<>();
//		if(svc.addCart(Integer.parseInt(cartNo))) {
//			map.put("retCode", "OK");
//		} else {
//			map.put("retCode", "NG");
//		}
	}

}
