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

public class AddCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		// memberNo, bookNo, quantity
		String memberNo = req.getParameter("memberNo");
		String bookNo = req.getParameter("bookNo");
		int quantity = 1;
		
		CartVO vo = new CartVO();
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		vo.setQuantity(quantity);
		
		CartService svc = new CartServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		// 아작스로 json 데이터 가져오는게 아니면 호출해서 숫자값으로 조건걸기.
//		svc.addCart(vo);
		
		
		if(svc.addCart(vo) == 1) {
			map.put("retCode", "OK");
		} else if (svc.addCart(vo) == 2){
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
