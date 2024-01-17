package com.yedam.cart.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class AddCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// memberNo, bookNo, quantity
		String memberNo = req.getParameter("memberNo");
		String bookNo = req.getParameter("bookNo");
		String quantity = req.getParameter("quantity");
		
		CartVO vo = new CartVO();
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setQuantity(Integer.parseInt(quantity));
		
		CartService svc = new CartServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		if(svc.addCart(vo)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		
	}

}
