package com.yedam.cart.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class ModifyCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String cartNo = req.getParameter("cno");
		String quantity = req.getParameter("quan");
		String memberNo = req.getParameter("mno");
		String bookNo = req.getParameter("bno");
		String name = req.getParameter("bookName");
		String price = req.getParameter("bookPrice");
		String img = req.getParameter("bookImg");
		
		CartVO vo = new CartVO(Integer.parseInt(cartNo), Integer.parseInt(quantity), Integer.parseInt(memberNo), Integer.parseInt(bookNo), name, Integer.parseInt(price), img);
		vo.setCartNo(Integer.parseInt(cartNo));
		vo.setQuantity(Integer.parseInt(quantity));
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setName(name);
		vo.setPrice(Integer.parseInt(price));
		vo.setImg(img);
		
		CartService svc = new CartServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		if(svc.modCart(vo)) {
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
